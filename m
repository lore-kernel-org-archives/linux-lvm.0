Return-Path: <hch@ns.caldera.de>
Date: Fri, 9 Feb 2001 09:34:05 +0100
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] questions
Message-ID: <20010209093404.B21158@caldera.de>
References: <20010209003003.B29707@vestdata.no> <200102090005.f1905bc08799@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200102090005.f1905bc08799@webber.adilger.net>; from adilger@turbolinux.com on Thu, Feb 08, 2001 at 05:05:36PM -0700
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

On Thu, Feb 08, 2001 at 05:05:36PM -0700, Andreas Dilger wrote:
> Change all of the code paths in the kernel that assume block size is 512
> bytes...

IIRC some S/390 devices already use 4K block size.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
