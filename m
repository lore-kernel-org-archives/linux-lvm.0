From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Single snapshots do weird things?
Message-ID: <20030916131154.G2155@uk.sistina.com>
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
Date: Tue Sep 16 07:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 16, 2003 at 09:12:15AM +1000, Glen Harris wrote:
> Is it mandatory to sync the filesystem before taking a snapshot?
 
If you want the snapshot to be consistent: that's what the VFS lock patch 
attempts to do automatically whenever you take a snapshot: presumably you 
haven't applied that patch?

Alasdair
-- 
agk@uk.sistina.com
