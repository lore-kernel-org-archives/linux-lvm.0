Return-Path: <markv@wave.co.nz>
Date: Fri, 29 Jun 2001 14:09:23 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <20010629140922.B32501@mail.wave.co.nz>
References: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu> <20010618095533.A32072@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010618095533.A32072@sistina.com>; from AJ Lewis on Mon, Jun 18, 2001 at 09:55:33AM -0500
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
To: linux-lvm@sistina.com
Cc: AJ Lewis <lewis@sistina.com>

On Mon, Jun 18, 2001 at 09:55:33AM -0500, AJ Lewis wrote:
> Just FYI, the entire build system is going to get an overhaul after the 1.0   
> release, so I will definitely be making sure these detail are kept in mind    
> for that.

Would it be possible to automatically build a liblvm_pic.a?  That would
allow building a "reduced" liblvm.so (containing only those functions
required for vgscan and vgchange), suitable for a tight initrd.

Thanks,

Mark.
