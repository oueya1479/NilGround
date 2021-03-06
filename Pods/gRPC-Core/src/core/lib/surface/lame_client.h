/*
 *
 * Copyright 2016 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#ifndef GRPC_CORE_LIB_SURFACE_LAME_CLIENT_H
#define GRPC_CORE_LIB_SURFACE_LAME_CLIENT_H

#include <grpc/support/port_platform.h>

#include "src/core/lib/channel/channel_stack.h"

namespace grpc_core {
// Does NOT take ownership of error.
grpc_arg MakeLameClientErrorArg(grpc_error_handle* error);
}  // namespace grpc_core

extern const grpc_channel_filter grpc_lame_filter;

#endif /* GRPC_CORE_LIB_SURFACE_LAME_CLIENT_H */
