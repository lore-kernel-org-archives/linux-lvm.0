Message-ID: <3BF923C3.A2060FDD@LTUtech.com>
From: Igor Dumaire <Igor.Dumaire@LTUtech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcfgrestore error !
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com> <3BF8F8BF.3FE1491C@LTUtech.com> <20011119151746.A13040@sistina.com>
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
Date: Mon Nov 19 09:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> 
> I overlooked the 'active VG' message vgcfgrestore is displaying.
> Because 'vgchange -an lvm1' wont't work in your situation I am afraid you need
> to reboot before being able to run vgcfgrestore successfully.
> 
After the reboot vgcfgrestore doesn't work !

# vgchange -an lvm1
vgchange -- volume group "lvm1" does not exist

# vgcfgrestore  -n lvm1  /dev/hde1
vgcfgrestore -- can't restore part of active volume group "lvm1"

What do I do ?

Regards,
-- 
Igor Dumaire

www.LTUtech.com - Making Sense of Visual Content
------------------------------------------------
