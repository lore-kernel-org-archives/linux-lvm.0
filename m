Return-Path: <lembark@wrkhors.com>
Date: Mon, 18 Jun 2001 10:11:53 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <18830000.992877113@dizzy>
In-Reply-To: <20010618095533.A32072@sistina.com>
References: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu>
 <20010618095533.A32072@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Just FYI, the entire build system is going to get an overhaul after the
> 1.0    release, so I will definitely be making sure these detail are kept
> in mind     for that.

It would be nice if --prefix worked consistently for the new release.  Until
some final kinks in devfs get worked over keeping the VG's out of /dev
without having to hack the source code would be helpful.
