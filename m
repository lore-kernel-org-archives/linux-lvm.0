Return-Path: <jlundell@pobox.com>
Mime-Version: 1.0
Message-Id: <p05100305b7761878d7b1@[207.213.214.37]>
In-Reply-To: <20010715025001.B6722@weta.f00f.org>
References: <E15LL3Y-0000yJ-00@the-village.bc.nu>
 <20010715025001.B6722@weta.f00f.org>
Date: Sat, 14 Jul 2001 08:41:52 -0700
From: Jonathan Lundell <jlundell@pobox.com>
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
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
Content-Transfer-Encoding: 7bit
To: Chris Wedgwood <cw@f00f.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

At 2:50 AM +1200 2001-07-15, Chris Wedgwood wrote:
>On Sat, Jul 14, 2001 at 09:45:44AM +0100, Alan Cox wrote:
>
>     As far as I can tell none of them at least in the IDE world
>
>SCSI disk must, or at least some... if not, how to peopel like NetApp
>get these cool HA certifications?

NetApp uses a large system-local NVRAM buffer, do they not?
-- 
/Jonathan Lundell.
