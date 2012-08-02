Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q72AGLUA015807
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 06:16:21 -0400
Received: from v041420.home.net.pl (v041420.home.net.pl [89.161.211.18])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q72AGH9e026845
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2012 06:16:18 -0400
From: Hubert Kario <hubert@kario.pl>
Date: Thu, 02 Aug 2012 12:16:08 +0200
Message-ID: <2897273.IW82gCqcCL@bursa22>
In-Reply-To: <20120802015017.GH11876@agk-dp.fab.redhat.com>
References: <1912398.2IYGSI2Xbi@bursa22> <2392219.d0OTJVWRfz@bursa22>
	<20120802015017.GH11876@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1401249.4s8AGRzfjg";
	micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-lvm@redhat.com


--nextPart1401249.4s8AGRzfjg
Content-Type: multipart/mixed; boundary="nextPart1966201.ALDtxO2xm5"
Content-Transfer-Encoding: 7Bit


--nextPart1966201.ALDtxO2xm5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 of August 2012 02:50:17 Alasdair G Kergon wrote:
> Another factor might be different contents in your lvm.conf file compared
> with mine, or different devices present causing you to hit a problem code
> path and me not to.

As far as I know, I'm using standard lvm.conf (attached).

I'm having the same error (in valgrind) when I run the test app as a regular 
user, so actual LVM config shouldn't have any effect (?):

  /dev/mapper/control: open failed: Permission denied
  Failure to communicate with kernel device-mapper driver.

> 
> Or some other difference in the distribution/compiler/libraries etc.

I don't think so, I've got a test app that reliably crashes with normal 
execution while works fine under valgrind:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <lvm2cmd.h>
#include <unistd.h>
#include <assert.h>
#include <signal.h>
#include <string.h>

int keep_running = 1;

void
signal_handler(int dummy)
{
    keep_running = 0;
}

int
main(int argc, char **argv)
{
    signal(SIGTERM, signal_handler);
    signal(SIGINT, signal_handler);

    const char dev[] = "string";

    printf("Variable before: \"%s\"\n", dev);

    void *handle = lvm2_init();

    lvm2_exit(handle);

    while (keep_running) {

        int arr_len = (random()%320+1) * 1024;

        char **table = malloc(sizeof(char *) * arr_len);
        assert(table);
        for (size_t i=0; i<arr_len; i++) {
            table[i] = strdup(dev);
            assert(table[i]);
        }

        char *big_alloc = malloc(arr_len * 1024);
        big_alloc[0] = '\0';
        big_alloc[4095] = '\0';
        big_alloc[arr_len * 1024 - 4096] = '\0';

        printf("Some text to output\n");

        char *string = strdup("Other text");

        printf("Variable after: \"%s\"\n", table[arr_len/2]);

        free(string);
        free(big_alloc);

        for (size_t i=0; i<arr_len; i++) {
            free(table[i]);
        }
        free(table);

        //sleep(1);
    }

    return 0;
}
-- 
Hubert Kario
hubert@kario.pl     kario@wit.edu.pl    https://hubert.kario.pl
PGP: 30D7 71F5 2F6F B157 872C  D811 A1D0 6BC9 8956 DCFE
--nextPart1966201.ALDtxO2xm5
Content-Disposition: attachment; filename="lvm.conf"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="lvm.conf"

devices {
    dir = "/dev"
    scan = [ "/dev" ]
    obtain_device_list_from_udev = 1
    preferred_names = [ ]
    filter = [ "a/.*/" ]
    cache_dir = "/etc/lvm/cache"
    cache_file_prefix = ""
    write_cache_state = 1
    sysfs_scan = 1
    multipath_component_detection = 1
    md_component_detection = 1
    md_chunk_alignment = 1
    data_alignment_detection = 1
    data_alignment = 0
    data_alignment_offset_detection = 1
    ignore_suspended_devices = 0
    disable_after_error_count = 0
    require_restorefile_with_uuid = 1
    pv_min_size = 2048
    issue_discards = 0
}
allocation {
 
    maximise_cling = 1
    mirror_logs_require_separate_pvs = 0
    thin_pool_metadata_require_separate_pvs = 0
}
log {
    verbose = 0
    syslog = 1
    overwrite = 0
    level = 0
    indent = 1
    command_names = 0
    prefix = "  "
}
backup {
    backup = 1
    backup_dir = "/etc/lvm/backup"
    archive = 1
    archive_dir = "/etc/lvm/archive"
    retain_min = 10
    retain_days = 30
}
shell {
    history_size = 100
}
global {
    umask = 077
    test = 0
    units = "h"
    si_unit_consistency = 1
    activation = 1
    proc = "/proc"
    locking_type = 1
    wait_for_locks = 1
    fallback_to_clustered_locking = 1
    fallback_to_local_locking = 1
    locking_dir = "/var/lock/lvm"
    prioritise_write_locks = 1
    abort_on_internal_errors = 0
    detect_internal_vg_cache_corruption = 0
    metadata_read_only = 0
    mirror_segtype_default = "mirror"
    use_lvmetad = 0
    thin_check_executable = ""
    thin_check_options = [ "-q" ]
}
activation {
    checks = 0
    udev_sync = 1
    udev_rules = 1
    verify_udev_operations = 0
    retry_deactivation = 1
    missing_stripe_filler = "error"
    use_linear_target = 1
    reserved_stack = 64
    reserved_memory = 8192
    process_priority = -18
    mirror_region_size = 512
    readahead = "auto"
    raid_fault_policy = "warn"
    mirror_log_fault_policy = "allocate"
    mirror_image_fault_policy = "remove"
    snapshot_autoextend_threshold = 100
    snapshot_autoextend_percent = 20
    thin_pool_autoextend_threshold = 100
    thin_pool_autoextend_percent = 20
    use_mlockall = 0
    monitoring = 1
    polling_interval = 15
}
dmeventd {
    mirror_library = "libdevmapper-event-lvm2mirror.so"
    snapshot_library = "libdevmapper-event-lvm2snapshot.so"
    thin_library = "libdevmapper-event-lvm2thin.so"
}

--nextPart1966201.ALDtxO2xm5--

--nextPart1401249.4s8AGRzfjg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAABAgAGBQJQGlNtAAoJEKHQa8mJVtz+iN8P/jAUPQBw95KP0ZShBcCV9YuX
Cas03902+P20Py2PKyPGCn4V2SMJMEkHdJbvQpXhGyff/TQfxpKyLmrdJ3DBG/56
wrMSMqoe7iNXxju+zf7bum6ka34JYn8olcqkwsFFaGM2G2wXXtukJAL5vY2Az301
+1zCadXRAY07fC+7nVNzGP3KN1E2ggkPehM4hbzv8ci2KpOVQ/9ph5EfrT5Yut2h
rqqmwlhtwY7AogADRitwsPaypF4X5ChoJ/0OLwjgQGOrJ6v898/anoHs26lyPgv/
xziSL0uASYQFOxxMQIzjSInsLGhMhNlmaCXHCpR93MrIidmcs8Rn7iSqsaxD+h29
Sa2mV3vZFa6qS02PIZYDykKdZy2arhCWfXmkF0LVxLiBS/AALtG0oRXfz8lVOm2y
AkgwggKhNYPXcxJkZCTwimjpQu2ogxT+rltMgNhzCPxSiefbhBmBuR8rlAoWkyM1
lXp+05Cc14O/W9sketchwyTvV48RKbZGg9EzQs7fdYMKT7fA93jem4DcKoMOvwxF
X7tEBfT636FdbuYhcB7aAvORWJDJ7Tczxn3naVunUg5jIofqKp4Xq5XhFo+tyNE/
Lbvt7vBZ7JvlK3Lz7ZBG1olX7biMr48odaNfaN++zOjLvcF+JqoWrlxqx9v4wnHF
CIiEqirtoyHXks6WdxpX
=VpEH
-----END PGP SIGNATURE-----

--nextPart1401249.4s8AGRzfjg--
