From: Craig Tierney <ctierney@hpti.com>
Message-Id: <20020502121825.B3956@hpti.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Can no longer mount lvm striped volume
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu May  2 13:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I just had a power outage and now I cannot
remount my LVM volumes.  I have to volume
groups each with one logical volume.  Each
vg is striped across two luns.

I started getting the errors:

vgscan -- ERROR: logical volume "/dev/sdd_vol2/lv1" reuses 
an existing device number; please vgexport/vgimport that VG 

I was using lvm-1.0.2 at the time so I could
not run vgscan -f.  So I upgraded my 2.4.14 kernel
to lvm-1.1-rc2 and gave it a try.

Now I vgscan will not complain about the logical
volumes, but I still cannot mount the ext3 filesystems
that are installed on the volumes.

I am now getting the error message:

[root@x06 /root]# mount -t ext3 /dev/sdd_vol2/ /export/sdd_vol2
mount: /dev/sdd_vol2/ is not a block device

IO nodes have gone down in the past due to
power interruptions, but I have never had
this catastrophic of a problem.  I have 16 volume
groups, and 3 or 4 appear to be affected.

Any ideas?

Thanks,
Craig


-- 
Craig Tierney (ctierney@hpti.com)
