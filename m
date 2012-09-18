Message-ID: <5057C9FD.1090403@omiha.com>
Date: Tue, 18 Sep 2012 13:10:21 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4EC09964.1080305@omiha.com> <4EC12F54.2000303@redhat.com>
	<4EC20A6A.10709@omiha.com> <4EC247E0.7050905@redhat.com>
	<4EC24A12.20200@redhat.com> <4EC2D031.3090101@omiha.com>
In-Reply-To: <4EC2D031.3090101@omiha.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to remove LVs - problem solved.
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
Content-Type: text/plain; charset="us-ascii"
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: linux-lvm@redhat.com

Hi Bryn,

I managed to figure it out.

dmsetup remove /dev/mapper/d-xm.dt1old1

removes the partition.

Then I can remove the LV.

Sorry to bother you.

Jan
