From: Eric Ren <zren@suse.com>
Message-ID: <dc362b54-42cf-025d-ec3a-22e14abc4745@suse.com>
Date: Mon, 20 Nov 2017 18:35:20 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] lvmlockd: how to convert lock_type from sanlock to dlm?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello David,

On my testing cluster,  the lvmlockd was firstly used with sanlock and 
everything was OK.
After some play, I want to change the "sanlock" lock_type of a VG into 
"dlm" locktype.

With dlm_controld running, I tried as following, but still failed.

1.  Performed as the "Changing dlm cluster name" section of `man lvmlockd`:

     # dlm_tool ls             // no lockspace available
     # vgs
        Reading VG vg1 without a lock.
       VG  #PV #LV #SN Attr   VSize  VFree
       vg1   1   1   0 wz--ns 19.97g 18.72g
     # vgchange --lock-type none --force vg1       // the cmd comes from 
`man lvmlockd`
   Command does not accept option: --force.

2. Tried with 'global/locking_type=0':

# vgchange --config 'global/locking_type=0' --lock-type dlm vg1
   WARNING: Locking disabled. Be careful! This could corrupt your metadata.
   ERROR: configuration setting use_lvmlockd cannot be used with 
clustered locking_type 3.

The error message is strange because the locking_type=0 in the command 
line and locking_type=1
in lvm.conf.

Not sure if it's a real problem or am doing something wrong?

Regards,
Eric
