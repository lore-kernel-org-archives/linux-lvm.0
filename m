Return-Path: <jbooth@ccbill.com>
Message-ID: <004901c0e56b$1e8d1e00$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
References: <200105251946.f4PJkXpg000560@webber.adilger.int>
Date: Fri, 25 May 2001 15:36:19 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm_chr_ioctl
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

I seem to be getting some errors for
lvm_chr_ioctl: unknown command 4004fe0a

When I do a vgcreate. I also noticed that if a partition is under heavy
strain and I take a snapshot, the snapshot seg. faults, and all subseqent
lvscans will also until I lvremove the volume and re-create it.

Should I be worried about the lvm_chr_ioctl???

Thanks in advance, Justin Booth
