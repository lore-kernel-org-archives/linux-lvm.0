From: tobias.bluhm@philips.com
Subject: Re: [linux-lvm] vgchange -ay at boot?
Message-ID: <OF94CEB26F.850B2FE6-ON85256C87.006C1AFE@diamond.philips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Date: Fri Dec  6 13:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The lvm module is not loaded when the init scripts run - you need to 
create or recreate your initrd image adding in the lvm module . . .

--
toby bluhm
philips medical systems, it support, mr development, cleveland ohio
tobias.bluhm@philips.com
440-483-5323




Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Sent by: linux-lvm-admin@sistina.com
12/06/2002 01:36 PM
Please respond to linux-lvm

 
        To:     Linux LVM Sistina <linux-lvm@sistina.com>
        cc:     (bcc: Tobias Bluhm/CLE/MS/PHILIPS)
        Subject:        [linux-lvm] vgchange -ay at boot?
        Classification: 



ive got lvm install on a redhat linux 7.3 system. the LV's totally work,
except i always have to mount them after bootup. id like to be able to put
the mounts into /etc/fstab, but when i do, the kernel can't boot and
complains about trying to mount an unknown device. obviously it cant see
the device im trying to mount because the volume group is not activated.
so, i put vgchange -ay homevg in my /etc/rc.local file, but apparently
that happens after the mounting on bootup, because it still complains
about non-existant device.

how do i turn on the volume group before it mounts the devices on bootup?

thanks in advance!

alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
