Return-Path: <luka@hermes.si>
Message-ID: <EA63CEA50DF8D311ABAD00B0D0211732024BE020@hal9000.hermes.si>
From: Luka Renko <luka.renko@hermes.si>
Date: Thu, 8 Feb 2001 21:39:49 +0100 
MIME-Version: 1.0
Subject: [linux-lvm] Installation question: SW RAID1 + LVM for boot and root
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, linux-lvm@sistina.com

Hello,

I would like to setup server with two SCSI disks of same size on two SCSI
channels with software RAID1 (md) and would like to put LVM on top of it.
This RAID1 will be used for root, boot, swap and should also have other user
data on it (this is why I want some flexibility that LVM can provide). 

I have looked different HOWTOs how to do this and have still some open
questions:

1. Is it possible to install OS directly on SW RAID1 + LVM?
If not, how to do it in multiple steps (RAID HOWTO just mentions how to
install OS on SW RAID1, but not using LVM on top of SW RAID)?

2. Are there any known problems on LVM over SW RAID1 (I have seen some bug
reports on that)?

3. RAID HOWTO talks about slow read performance with RAID1 and that it
should be improved in new patches to come? Is this still true? Do I need to
apply any patches for that?

4. I have also seen some discussion about issues with putting swap on SW
RAID? Is this still true?

5. Should I create one or two (system, user) md devices? Is there any
difference?
What about multiple LVM VGs and PVs? It seems to me, that it does not make
any real difference...

6. What version of kernel (2.2 or 2.4) is better for such configuration?
What version of SW RAID and LVM should I use? Are there any additional
patches I should apply?

7. Does any distribution on the market (RedHat, SuSE, Mandrake...) have good
support for configuration I want? Or even is able to install on SW RAID1 +
LVM?   
(answers on that can be private in order not to be accussed of marketing
;-))

Regards,
Luka
