Message-ID: <3D1AF4FB.1080605@ti.com>
From: christian e <cej@ti.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem running vgscan..Is it a megaraid issue or
 an LVM issue ??
References: <3D1AD32B.400@ti.com> <20020627115054.B21400@sistina.com>
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
Date: Thu Jun 27 06:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> Christian,
> 
> are the Megaraid devices all accessable (driver module loaded/linked in)
> when vgscan runs on reboot?
> 
> 

Yes I can boot the machine up without running vgscan and everything is 
OK..So it's not a showstopper but it bugs me because it's not always 
been like that..Could it be the way the PVs are made ?? That one is 
/dev/sdb1 and the other /dev/sdc ?? So one is actually on a partition 
taking up the entire disk and the other is directly on the disk without 
partition ?? Hope that made sense..hehe..It could maybe explain things 
as our data is now taking up more thatn just the one PV..

best regards

Christian
-- 
Christian Ejstrup, IT Admin / RF Development Engineer
Texas Instruments A/S, Denmark ,Sofiendalsvej 93,DK-9200 Aalborg SV,Denmark
Phone:+45 96346868, Phone(direct):+45 96346860, GSM:+45 22234304
