From: Spam <spam@tnonline.net>
Message-ID: <6171240268.20031130135656@tnonline.net>
Subject: Re: [linux-lvm] Disk damaged
In-Reply-To: <82706A2FAC4D08468A1652B4B7DD0C44CB0A40@mx1.bouvet.no>
References: <82706A2FAC4D08468A1652B4B7DD0C44CB0A40@mx1.bouvet.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Nov 30 06:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Kjetil H. Paulsen" <linux-lvm@sistina.com>

  The  first  thing  you should do is to find another disk of the same
  size  and  model  and  then  try dd_rescue to move whatever readable
  information you can.



> Hi
 
> It seems like one of my disks as gone down, fortunately the last
> disk in the volume (/dev/hdg). Can I get about this by doing:
 
> vgreduce vol_grp /dev/hdg
> umount /stuff
> e2fsadm -L-60G /dev/vol_grp/big

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
