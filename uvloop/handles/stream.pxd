cdef class UVStream(UVHandle):
    cdef:
        uv.uv_shutdown_t _shutdown_req
        bint __reading
        object __cached_socket

    cdef _fileno(self)
    cdef _get_socket(self)

    cdef _shutdown(self)

    cdef _listen(self, int backlog)
    cdef _accept(self, UVStream server)

    cdef _start_reading(self)
    cdef _stop_reading(self)
    cdef __reading_started(self)
    cdef __reading_stopped(self)

    cdef bint _is_readable(self)
    cdef bint _is_writable(self)

    cdef _write(self, object data, object callback)

    cdef _close(self)

    # The following methods have to be overridden:
    cdef _on_accept(self)
    cdef _on_listen(self)
    cdef _on_read(self, bytes buf)
    cdef _on_eof(self)
    cdef _on_write(self)
    cdef _on_shutdown(self)