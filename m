References: <b6dd0ff9-402c-d2f7-8a15-672207953f99@ba-consultants.fr>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <f5f8d9ab-09c4-8328-2155-7d24b85c99e5@redhat.com>
Date: Mon, 29 Jun 2020 16:34:17 +0200
MIME-Version: 1.0
In-Reply-To: <b6dd0ff9-402c-d2f7-8a15-672207953f99@ba-consultants.fr>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-crypt] LuksOpen hangs ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dm-crypt@saout.de
Cc: B&A Consultants <infos+dmcrypt@ba-consultants.fr>, linux-lvm@redhat.com

On 6/28/20 8:48 AM, B&A Consultants wrote:
> Hello,
> 
> We are using LVM to hold several luks-encrypted LVs. A few days ago,
> while two of those LV were in use (at least opened for one, not sure
> there was any disk activity ; the second one was only read from at that
> time), we've had a power outage (despite UPS). Duh.
> 
> On restart the next day, one of the LV fails to open. LuksOpen hangs,
> with one of the LVM disks churning (at last that's what the acces LED
> seems to tell). From then on, any LVM operation hangs, but the machine
> is properly responsive.

Could you please send debug output also for particular hanging lvm2 
command? Just add -vvvv to the command. Syslog output would also help.

I can't tell you more than the cryptsetup command is stuck in I/O. 
Perhaps hosting LV is suspended due to some error but I can't tell for sure.

> 
> We tried a few things, the first being to check/repair the header :
> 
> cryptsetup --verbose --debug repair /dev/v03/E192
> # cryptsetup 2.3.2 processing "cryptsetup --verbose --debug repair
> /dev/v03/E192"
> # Running command repair.
> # Locking memory.
> # Installing SIGINT/SIGTERM handler.
> # Unblocking interruption on signal.
> # Allocating context for crypt device /dev/v03/E192.
> # Trying to open and read device /dev/v03/E192 with direct-io.
> # Initialising device-mapper backend library.
> # Trying to load any crypt type from device /dev/v03/E192.
> # Crypto backend (OpenSSL 1.1.1g  21 Apr 2020) initialized in cryptsetup
> library version 2.3.2.
> # Detected kernel Linux 5.4.38-gentoo-LTS x86_64.
> # PBKDF pbkdf2-sha256, time_ms 2000 (iterations 0).
> # Reading LUKS header of size 1024 from device /dev/v03/E192
> # Key length 32, device size 2147483648 sectors, header size 2050 sectors.
> No known problems detected for LUKS header.
> # Releasing crypt device /dev/v03/E192 context.
> # Releasing device-mapper backend.
> # Closing read only fd for /dev/v03/E192.
> # Unlocking memory.
> Command successful.
> 
> Dumping the header seems ok :
> 
> cryptsetup luksDump /dev/v03/E192 --verbose --debug
> # cryptsetup 2.3.2 processing "cryptsetup luksDump /dev/v03/E192
> --verbose --debug"
> # Running command luksDump.
> # Locking memory.
> # Installing SIGINT/SIGTERM handler.
> # Unblocking interruption on signal.
> # Allocating context for crypt device /dev/v03/E192.
> # Trying to open and read device /dev/v03/E192 with direct-io.
> # Initialising device-mapper backend library.
> # Trying to load any crypt type from device /dev/v03/E192.
> # Crypto backend (OpenSSL 1.1.1g  21 Apr 2020) initialized in cryptsetup
> library version 2.3.2.
> # Detected kernel Linux 5.4.38-gentoo-LTS x86_64.
> # PBKDF pbkdf2-sha256, time_ms 2000 (iterations 0).
> # Reading LUKS header of size 1024 from device /dev/v03/E192
> # Key length 32, device size 2147483648 sectors, header size 2050 sectors.
> LUKS header information for /dev/v03/E192
> 
> Version:        1
> Cipher name:    aes
> Cipher mode:    xts-plain64
> Hash spec:      sha256
> Payload offset: 4096
> MK bits:        256
> MK digest:      52 [..] 52
> MK salt:        50 [..] 16
>                  a4 [..] df
> MK iterations:  365500
> UUID:           9bcee5de-aa79-42f1-bcd2-9ecfc0acc30f
> 
> Key Slot 0: ENABLED
>          Iterations:             2921539
>          Salt:                   24 [..] 79
>                                  f1 [..] 90
>          Key material offset:    8
>          AF stripes:             4000
> Key Slot 1: DISABLED
> Key Slot 2: DISABLED
> Key Slot 3: DISABLED
> Key Slot 4: DISABLED
> Key Slot 5: DISABLED
> Key Slot 6: DISABLED
> Key Slot 7: DISABLED
> # Releasing crypt device /dev/v03/E192 context.
> # Releasing device-mapper backend.
> # Closing read only fd for /dev/v03/E192.
> # Unlocking memory.
> Command successful.
> 
> Opening the other luks-encrypted volume is ok :
> 
> # cryptsetup luksOpen /dev/v03/P50-Abc abc --verbose --debug
> # cryptsetup 2.3.2 processing "cryptsetup luksOpen /dev/v03/P50-Abc abc
> --verbose --debug"
> # Running command open.
> # Locking memory.
> # Installing SIGINT/SIGTERM handler.
> # Unblocking interruption on signal.
> # Allocating context for crypt device /dev/v03/P50-Abc.
> # Trying to open and read device /dev/v03/P50-Abc with direct-io.
> # Initialising device-mapper backend library.
> 
> # Trying to load any crypt type from device /dev/v03/P50-Abc.
> # Crypto backend (OpenSSL 1.1.1g  21 Apr 2020) initialized in cryptsetup
> library version 2.3.2.
> # Detected kernel Linux 5.4.38-gentoo-LTS x86_64.
> # Loading LUKS2 header (repair disabled).
> # Acquiring read lock for device /dev/v03/P50-Abc.
> # Opening lock resource file /run/cryptsetup/L_253:4
> # Verifying lock handle for /dev/v03/P50-Abc.
> # Device /dev/v03/P50-Abc READ lock taken.
> # Trying to read primary LUKS2 header at offset 0x0.
> # Opening locked device /dev/v03/P50-Abc
> # Veryfing locked device handle (bdev)
> 
> # LUKS2 header version 2 of size 16384 bytes, checksum sha256.
> #
> Checksum:19a91de16d41e5f80d15db4dbaefcb895b9f70b908b126550f3b931b3159b739 (on-disk)
> #
> Checksum:19a91de16d41e5f80d15db4dbaefcb895b9f70b908b126550f3b931b3159b739 (in-memory)
> # Trying to read secondary LUKS2 header at offset 0x4000.
> # Reusing open ro fd on device /dev/v03/P50-Abc
> # LUKS2 header version 2 of size 16384 bytes, checksum sha256.
> #
> Checksum:b0be8a6ecf4c15822d52d7d0f3a24f5ae7d4012f244f47d5e4c9d7172b3fea26 (on-disk)
> #
> Checksum:b0be8a6ecf4c15822d52d7d0f3a24f5ae7d4012f244f47d5e4c9d7172b3fea26 (in-memory)
> # Device size 644245094400, offset 16777216.
> # Device /dev/v03/P50-Abc READ lock released.
> # PBKDF argon2i, time_ms 2000 (iterations 0), max_memory_kb 1048576,
> parallel_threads 4.
> # Activating volume abc using token -1.
> # Interactive passphrase entry requested.
> Enter passphrase for /dev/v03/P50-Abc:
> # Activating volume abc [keyslot -1] using passphrase.
> # dm version   [ opencount flush ]   [16384] (*1)
> # dm versions   [ opencount flush ]   [16384] (*1)
> # Detected dm-ioctl version 4.41.0.
> # Detected dm-crypt version 1.19.0.
> # Device-mapper backend running with UDEV support enabled.
> # dm status abc  [ opencount noflush ]   [16384] (*1)
> # Keyslot 0 priority 1 != 2 (required), skipped.
> # Trying to open LUKS2 keyslot 0.
> # Reading keyslot area [0x8000].
> # Acquiring read lock for device /dev/v03/P50-Abc.
> # Opening lock resource file /run/cryptsetup/L_253:4
> # Verifying lock handle for /dev/v03/P50-Abc.
> # Device /dev/v03/P50-Abc READ lock taken.
> # Reusing open ro fd on device /dev/v03/P50-Abc
> # Device /dev/v03/P50-Abc READ lock released.
> # Verifying key from keyslot 0, digest 0.
> # Loading key (64 bytes, type logon) in thread keyring.
> # dm versions   [ opencount flush ]   [16384] (*1)
> # dm status abc  [ opencount noflush ]   [16384] (*1)
> # Calculated device size is 1258258432 sectors (RW), offset 32768.
> # DM-UUID is CRYPT-LUKS2-590a43f175534729a95c5c1beff86e2b-abc
> # Udev cookie 0xd4d7a75 (semid 7) created
> # Udev cookie 0xd4d7a75 (semid 7) incremented to 1
> # Udev cookie 0xd4d7a75 (semid 7) incremented to 2
> # Udev cookie 0xd4d7a75 (semid 7) assigned to CREATE task(0) with flags
> DISABLE_LIBRARY_FALLBACK         (0x20)
> # dm create abc CRYPT-LUKS2-590a43f175534729a95c5c1beff86e2b-abc [
> opencount flush ]   [16384] (*1)
> # dm reload abc  [ opencount flush securedata ]   [16384] (*1)
> # dm resume abc  [ opencount flush securedata ]   [16384] (*1)
> # abc: Stacking NODE_ADD (253,5) 0:0 0600 [trust_udev]
> # abc: Stacking NODE_READ_AHEAD 256 (flags=1)
> # Udev cookie 0xd4d7a75 (semid 7) decremented to 1
> # Udev cookie 0xd4d7a75 (semid 7) waiting for zero
> # Udev cookie 0xd4d7a75 (semid 7) destroyed
> # abc: Skipping NODE_ADD (253,5) 0:0 0600 [trust_udev]
> # abc: Processing NODE_READ_AHEAD 256 (flags=1)
> # abc (253:5): read ahead is 256
> # abc: retaining kernel read ahead of 256 (requested 256)
> Key slot 0 unlocked.
> # Releasing crypt device /dev/v03/P50-Abc context.
> # Releasing device-mapper backend.
> # Closing read only fd for /dev/v03/P50-Abc.
> # Unlocking memory.
> Command successful.
> 
> But opening the "relevant" LV hangs when accessing the keyslot (we do
> have the proper password, thanks to password managers) :
> 
> cryptsetup --verbose --debug open /dev/v03/E192 192
> # cryptsetup 2.3.2 processing "cryptsetup --verbose --debug open
> /dev/v03/E192 192"
> # Running command open.
> # Locking memory.
> # Installing SIGINT/SIGTERM handler.
> # Unblocking interruption on signal.
> # Allocating context for crypt device /dev/v03/E192.
> # Trying to open and read device /dev/v03/E192 with direct-io.
> # Initialising device-mapper backend library.
> # Trying to load any crypt type from device /dev/v03/E192.
> # Crypto backend (OpenSSL 1.1.1g  21 Apr 2020) initialized in cryptsetup
> library version 2.3.2.
> # Detected kernel Linux 5.4.38-gentoo-LTS x86_64.
> # PBKDF pbkdf2-sha256, time_ms 2000 (iterations 0).
> # Reading LUKS header of size 1024 from device /dev/v03/E192
> # Key length 32, device size 2147483648 sectors, header size 2050 sectors.
> # Activating volume 192 using token -1.
> # Interactive passphrase entry requested.
> Enter passphrase for /dev/v03/E192:
> # Activating volume 192 [keyslot -1] using passphrase.
> # dm version   [ opencount flush ]   [16384] (*1)
> # dm versions   [ opencount flush ]   [16384] (*1)
> # Detected dm-ioctl version 4.41.0.
> # Detected dm-crypt version 1.19.0.
> # Device-mapper backend running with UDEV support enabled.
> # dm status 192  [ opencount noflush ]   [16384] (*1)
> # Trying to open key slot 0 [ACTIVE_LAST].
> # Reading key slot 0 area.
> # Using userspace crypto wrapper to access keyslot area.
> # Reusing open ro fd on device /dev/v03/E192        <- last message
> displayed by cryptsetup
> 
> In this situation, ps says this about the cryptsetup process :
> 
> 7265 pts/3    D<L+   0:01 cryptsetup --verbose --debug open
> /dev/v03/E192 192
> 
> Any idea on how to get back access to our data ?
> Or anything obviously wrong we did not see ?
> 
> Tia,
> 
