Message-ID: <3F66474F.9070106@gbrmpa.gov.au>
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Single snapshots do weird things?
References: <3F663873.6070008@gbrmpa.gov.au> <20030915233257.E2155@uk.sistina.com>
In-Reply-To: <20030915233257.E2155@uk.sistina.com>
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
Date: Mon Sep 15 18:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alasdair G Kergon <agk@uk.sistina.com>
Cc: linux-lvm@sistina.com

Hey, that fixed it! I've created 5 snapshots with copying/deleting
files in between, and they've all worked!

Well, except for one. I copied a file and took a snapshot and the file
wasn't in the snapshot. Running sync and making another snapshot *did*
have the file, though.

Is it mandatory to sync the filesystem before taking a snapshot?

Alasdair G Kergon wrote:
>
> Stick to using read/write snapshots for now.  With read-only ones, 
> it seems the COW device is incorrectly getting set read-only.

-- 
| Nine megs for the secretaries fair,      | One disk to rule them all,     |
| Seven megs for the hackers scarce,       | One disk to bind them,         |
| Five megs for the grads in smoky lairs,  | One disk to hold the files     |
| Three megs for system source;            | And in the darkness grind 'em. |
-----------------------------------------------------------------------------
| Glen Harris | glen@gbrmpa.gov.au | 07 47500893 | http://www.gbrmpa.gov.au |
-----------------------------------------------------------------------------

=============================================================================
If you have received this transmission in error please notify us immediately
by return email and delete all copies. Any unauthorised use, disclosure or
distribution of this email is prohibited.
=============================================================================
