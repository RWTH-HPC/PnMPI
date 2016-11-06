/* This file is part of P^nMPI.
 *
 * Copyright (c)
 *  2008-2016 Lawrence Livermore National Laboratories, United States of America
 *  2011-2016 ZIH, Technische Universitaet Dresden, Federal Republic of Germany
 *  2013-2016 RWTH Aachen University, Federal Republic of Germany
 *
 *
 * P^nMPI is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation version 2.1 dated February 1999.
 *
 * P^nMPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with P^nMPI; if not, write to the
 *
 *   Free Software Foundation, Inc.
 *   51 Franklin St, Fifth Floor
 *   Boston, MA 02110, USA
 *
 *
 * Written by Martin Schulz, schulzm@llnl.gov.
 *
 * LLNL-CODE-402774
 */

#include "config.h"


/* For the timing module we need thread local storage, otherwise storage may be
 * corrupted for MPI applications with concurrent calls (MPI threading level
 * MPI_THREAD_MULTIPLE).
 *
 * We'll try to use C11 threads or the compilers builtin __thread to get
 * thread local storage. If thread local storage is not supported by the
 * compiler, we'll set the METRIC_NO_TLS macro, so the modules can handle this.
 */

#if defined(C11_THREAD_LOCAL_FOUND)

#define metric_tls_keyword _Thread_local

#elif defined(THREADKEYWORD_FOUND)

#define metric_tls_keyword __thread

#else

#define METRIC_NO_TLS
#define metric_tls_keyword

#endif
