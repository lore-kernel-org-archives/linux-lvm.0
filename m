References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
From: fauno <fauno@partidopirata.com.ar>
Message-ID: <574D8EE6.8020903@partidopirata.com.ar>
Date: Tue, 31 May 2016 10:17:26 -0300
MIME-Version: 1.0
In-Reply-To: <dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="L3CHauxmfUal8US2S4aBxkucXlfPGUrVa"
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
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
To: linux-lvm@redhat.com
Cc: okozina@redhat.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L3CHauxmfUal8US2S4aBxkucXlfPGUrVa
Content-Type: multipart/mixed; boundary="M6OsmTUQL60SO19SVJGxkSVtVtCSvP5Uq"
From: fauno <fauno@partidopirata.com.ar>
To: linux-lvm@redhat.com
Cc: okozina@redhat.com
Message-ID: <574D8EE6.8020903@partidopirata.com.ar>
Subject: Re: [dm-crypt] LVM on LUKS: volumes missing
References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
In-Reply-To: <dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>

--M6OsmTUQL60SO19SVJGxkSVtVtCSvP5Uq
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 31/05/16 04:53, Ondrej Kozina wrote:
> Hi fauno,
>=20
> provided the driver was unlocked successfully it seems unrelated to
> cryptsetup/LUKS to me. Could we move the discussion to lvm mail list?

ok :)

> On 05/30/2016 11:54 PM, fauno wrote:
>> Hi, maybe I'm too shocked but I couldn't find anything on this issue :=
)
>>
>> I have a fully encrypted HD using the LVM on LUKS method from
>> ArchWiki[^0], with the LUKS header and key file on an external device.=

>>
>> Today I started having some disk failures (root remounted ro, xfs
>> partition giving errors), and after I decided to reboot to run fsck, I=

>> can't find anything.
>=20
> Could you paste here output of pvscan -vvvv --cache
> /dev/mapper/insert_the_unlocked_device_name?

#libdm-config.c:863       Setting activation/monitoring to 0
#lvmcmdline.c:1093         Processing: pvscan -vvvv --cache
/dev/mapper/system
#lvmcmdline.c:1096         O_DIRECT will be used
#libdm-config.c:799       Setting global/locking_type to 1
#libdm-config.c:799       Setting global/wait_for_locks to 1
#locking/locking.c:242       File-based locking selected.
#libdm-config.c:768       Setting global/locking_dir to /run/lock/lvm
#libdm-config.c:863       Setting global/prioritise_write_locks to 1
#locking/file_locking.c:236       Locking /run/lock/lvm/P_global RB
#locking/file_locking.c:141         _do_flock /run/lock/lvm/P_global:aux =
WB
#locking/file_locking.c:51         _undo_flock /run/lock/lvm/P_global:aux=

#locking/file_locking.c:141         _do_flock /run/lock/lvm/P_global RB
#pvscan.c:150     Using physical volume(s) on command line
#device/dev-cache.c:347         /dev/mapper/system: Added to device cache=

#locking/file_locking.c:74       Unlocking /run/lock/lvm/P_global
#locking/file_locking.c:51         _undo_flock /run/lock/lvm/P_global
  Command failed with status code 5.

> Together with your
> /etc/lvm/lvm.conf file? If it's a device with rootfs we're talking abou=
t
> you will most probably have to extract /etc/lvm/lvm.conf file from
> initramfs image.

this is the lvm.conf from the initramfs (removed comments)


config {
	checks =3D 1
	abort_on_errors =3D 0
	profile_dir =3D "/etc/lvm/profile"
}
devices {
	dir =3D "/dev"
	scan =3D [ "/dev" ]
	obtain_device_list_from_udev =3D 1
	external_device_info_source =3D "none"
	cache_dir =3D "/etc/lvm/cache"
	cache_file_prefix =3D ""
	write_cache_state =3D 1
	sysfs_scan =3D 1
	multipath_component_detection =3D 1
	md_component_detection =3D 1
	fw_raid_component_detection =3D 0
	md_chunk_alignment =3D 1
	data_alignment_detection =3D 1
	data_alignment =3D 0
	data_alignment_offset_detection =3D 1
	ignore_suspended_devices =3D 0
	ignore_lvm_mirrors =3D 1
	disable_after_error_count =3D 0
	require_restorefile_with_uuid =3D 1
	pv_min_size =3D 2048
	issue_discards =3D 0
}
allocation {
	maximise_cling =3D 1
	use_blkid_wiping =3D 1
	wipe_signatures_when_zeroing_new_lvs =3D 1
	mirror_logs_require_separate_pvs =3D 0
	cache_pool_metadata_require_separate_pvs =3D 0
	thin_pool_metadata_require_separate_pvs =3D 0
}
log {
	verbose =3D 0
	silent =3D 0
	syslog =3D 1
	overwrite =3D 0
	level =3D 0
	indent =3D 1
	command_names =3D 0
	prefix =3D "  "
	activation =3D 0
	debug_classes =3D [ "memory", "devices", "activation", "allocation",
"lvmetad", "metadata", "cache", "locking", "lvmpolld" ]
}
backup {
	backup =3D 1
	backup_dir =3D "/etc/lvm/backup"
	archive =3D 1
	archive_dir =3D "/etc/lvm/archive"
	retain_min =3D 10
	retain_days =3D 30
}
shell {
	history_size =3D 100
}
global {
	umask =3D 077
	test =3D 0
	units =3D "h"
	si_unit_consistency =3D 1
	suffix =3D 1
	activation =3D 1
	proc =3D "/proc"
	etc =3D "/etc"
	locking_type =3D 1
	wait_for_locks =3D 1
	fallback_to_clustered_locking =3D 1
	fallback_to_local_locking =3D 1
	locking_dir =3D "/run/lock/lvm"
	prioritise_write_locks =3D 1
	abort_on_internal_errors =3D 0
	detect_internal_vg_cache_corruption =3D 0
	metadata_read_only =3D 0
	mirror_segtype_default =3D "raid1"
	raid10_segtype_default =3D "raid10"
	sparse_segtype_default =3D "thin"
	use_lvmetad =3D 1
	use_lvmlockd =3D 0
	system_id_source =3D "none"
	use_lvmpolld =3D 0
}
activation {
	checks =3D 0
	udev_sync =3D 1
	udev_rules =3D 1
	verify_udev_operations =3D 0
	retry_deactivation =3D 1
	missing_stripe_filler =3D "error"
	use_linear_target =3D 1
	reserved_stack =3D 64
	reserved_memory =3D 8192
	process_priority =3D -18
	raid_region_size =3D 512
	readahead =3D "auto"
	raid_fault_policy =3D "warn"
	mirror_image_fault_policy =3D "remove"
	mirror_log_fault_policy =3D "allocate"
	snapshot_autoextend_threshold =3D 100
	snapshot_autoextend_percent =3D 20
	thin_pool_autoextend_threshold =3D 100
	thin_pool_autoextend_percent =3D 20
	use_mlockall =3D 0
	monitoring =3D 1
	polling_interval =3D 15
	activation_mode =3D "degraded"
}
dmeventd {
	mirror_library =3D "libdevmapper-event-lvm2mirror.so"
	snapshot_library =3D "libdevmapper-event-lvm2snapshot.so"
	thin_library =3D "libdevmapper-event-lvm2thin.so"
}



> Well, generally, if disk sectors accommodating PV header are damaged,
> lvm2 won't recognise the device...

:(


--=20
http://utopia.partidopirata.com.ar/


--M6OsmTUQL60SO19SVJGxkSVtVtCSvP5Uq--

--L3CHauxmfUal8US2S4aBxkucXlfPGUrVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQF8BAEBCgBmBQJXTY7mXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ0OUY3MDdBMUNCMzY2QzU4MEU2MjVCM0M0
NTYwMzJENzE3QTRDRDlDAAoJEEVgMtcXpM2c4zoIAK+srw0/9a7a8u+b34GZ69Y+
Xv2acOGggCCLxgfQQtssZxYYe8VP6ZGmr6MRUtM11q2ybdaQ8nz+F6gR53UqnY4j
BmcyGNwJVXkPGo7T4DqbDEEgXUypdYUc1SUDUJKt3mLMF23Hizsb0IZhluQTfajZ
acEzCQW0f5qNFKr+pxsa2kIDIIfyFJ6rGZAcEHp5WVqxcP/buHqDyfHQPuCO7mlv
+/6+K6uMftjt2vmrC/zo3TYsNybPgbtd+WB15dEKoH9pdjK0XNw8iGdh3dNvd4ta
G2uJrm26vA39gbEKu//NP147OroiZPaliU3Om/EdpSNlOR3GuE2+9PMt/7arLOw=
=4X2I
-----END PGP SIGNATURE-----

--L3CHauxmfUal8US2S4aBxkucXlfPGUrVa--
