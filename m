content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Oct 2001 16:45:11 -0500
Message-ID: <45B36A38D959B44CB032DA427A6E106417C8D9@cceexc18.americas.cpqcorp.net>
From: "Bradburn, Michael" <Michael.Bradburn@COMPAQ.com>
Subject: [linux-lvm] Error vg_read_with_pv_and_lv... just want to clean up
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
To: linux-lvm@sistina.com

Hello,

I am running Suse 7.2 Professional and we were playing around with the
LVM and were trying to remove existing volumes and create new ones.  To
make a long story short, I am getting the following error message when I
run vgscan:

found inactive volume group "vg00"
only found 0 of 4340 LEs for LV /dev/vg00/lvol1(0)
Error "vg_read_with_pv_and_lv(): allocated LE and LV"
cant get data of volume group "vg00" from physical volume(s)
...

I don't care about recovery, I just want to clean up and start over.
Can someone give me the steps to clean this mess up so I can start over?
This is a lab machine and there was no data on these volumes.

Thanks,

Michael C. Bradburn
Systems Engineer, ESE - Oracle=20
Compaq Computer Corporation
(281) 518-9127
Michael.Bradburn@Compaq.com
