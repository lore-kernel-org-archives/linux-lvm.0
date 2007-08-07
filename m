Date: Tue, 7 Aug 2007 22:50:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20070807215020.GF2064@agk.fab.redhat.com>
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
	<46B254E4.60700@cfl.rr.com> <20070803081133.GB939@percy.comedia.it>
	<46B36F7A.2090601@cfl.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B36F7A.2090601@cfl.rr.com>
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>, "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>, linux-lvm@redhat.com

On Fri, Aug 03, 2007 at 02:10:02PM -0400, Phillip Susi wrote:
> Where does lvm store state 
> information right now?  In conf files in /etc isn't it?  

It uses an untrusted cache in /etc/lvm as hints to speed up its
processing if the hints prove to be still correct.  It can't ever trust
because things can change on the system without lvm2's knowledge.  And
device scanning causes us no end of problems - particularly in a
clustered environment.  The new model should provide us with a
completely-reliable cache.

And why does lvm2 today have to include code to check for partition
tables, md devices, filesystems etc.?

If all these components co-operated through common interfaces there'd be
no need!

Alasdair
-- 
agk@redhat.com
