Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 6 Feb 2001 09:37:00 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
Message-ID: <20010206093700.A528@tykepenguin.com>
References: <200102051822.f15IMHW01674@case.toyota.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102051822.f15IMHW01674@case.toyota.com>; from root@case.toyota.com on Mon, Feb 05, 2001 at 10:22:17AM -0800
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

On Mon, Feb 05, 2001 at 10:22:17AM -0800, root wrote:
> Hi All,
> 
> I am seeing a buglet with recent lvm (0.9.1_betax) and Compaq "smart" 
> controllers. The lvm is functional, but the reporting is buggy; 
> specifically, lvmdiskscan reports that no valid disks/partitions are 
> found, despite the fact that there are functional logical volumes.

It probably just needs COMPAQ_SMART2_MAJOR (& COMPAQ_SMART_MAJOR[1-7]) adding
into the list in lvm_check_partitioned_dev.c. It's already in lvm_check_dev.c so
I suspect it's just an oversight.

Can you try this and let me know if it fixes it please ?


patrick
