/*
 * Copyright (c) 2020 - 2024 Renesas Electronics Corporation and/or its affiliates
 *
 * SPDX-License-Identifier:  BSD-3-Clause
 */

#include "common_utils.h"
#include "main_application.h"

// Uncomment the desired debug level
#include "log_disabled.h"

// #include "log_error.h"
// #include "log_warning.h"
// #include "log_info.h"
// #include "log_debug.h"

/*******************************************************************************************************************//**
 * @addtogroup r_sci_uart_ep
 * @{
 **********************************************************************************************************************/

void R_BSP_WarmStart(bsp_warm_start_event_t event);

/*******************************************************************************************************************//**
 * The RA Configuration tool generates main() and uses it to generate threads if an RTOS is used.  This function is
 * called by main() when no RTOS is used.
 **********************************************************************************************************************/
void hal_entry (void)
{
    fsp_pack_version_t version = {RESET_VALUE};

    /* Version get API for FLEX pack information */
    R_FSP_VersionGet(&version);

    log_info("The project blinks LEDs in sequence");

    /* Runs sensor manager and published temperatures to serial console */
    main_application();
}

/*******************************************************************************************************************//**
 * This function is called at various points during the startup process.  This implementation uses the event that is
 * called right before main() to set up the pins.
 *
 * @param[in]  event    Where at in the start up process the code is currently at
 **********************************************************************************************************************/
void R_BSP_WarmStart (bsp_warm_start_event_t event)
{
    if (BSP_WARM_START_POST_C == event)
    {
        /* C runtime environment and system clocks are setup. */

        /* Configure pins. */
        R_IOPORT_Open(&g_ioport_ctrl, &g_bsp_pin_cfg);

        /* Open and enable the external IRQ configured for P0_05 / IRQ10. */
        fsp_err_t err = R_ICU_ExternalIrqOpen(&g_external_irq0_ctrl, &g_external_irq0_cfg);
        if (FSP_SUCCESS == err)
        {
            err = R_ICU_ExternalIrqEnable(&g_external_irq0_ctrl);
        }

        if (FSP_SUCCESS != err)
        {
            while (1)
            {
                /* Failed to initialize interrupt; keep CPU here to debug. */
            }
        }
    }
}

/*******************************************************************************************************************//**
 * @} (end addtogroup r_sci_uart_ep)
 **********************************************************************************************************************/
