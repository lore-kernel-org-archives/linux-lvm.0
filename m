From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Single snapshots do weird things?
Message-ID: <20030916173855.I2155@uk.sistina.com>
References: <3F663873.6070008@gbrmpa.gov.au> <20030915233257.E2155@uk.sistina.com> <3F66474F.9070106@gbrmpa.gov.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F66474F.9070106@gbrmpa.gov.au>; from glen@gbrmpa.gov.au on Tue, Sep 16, 2003 at 09:12:15AM +1000
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
Date: Tue Sep 16 11:40:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 16, 2003 at 09:12:15AM +1000, Glen Harris wrote:
> Hey, that fixed it! I've created 5 snapshots with copying/deleting
> files in between, and they've all worked!
 
I've put a new tarball up on the ftp site containing a fix for the
read-only snapshot problem together with some other minor fixes.

ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.2.00.07.tgz

Alasdair
-- 
agk@uk.sistina.com
