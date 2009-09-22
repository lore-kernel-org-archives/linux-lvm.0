Date: Tue, 22 Sep 2009 17:11:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Disk crash on LVM
Message-ID: <20090922161134.GQ1210@agk-dp.fab.redhat.com>
References: <45A063C7CD9F458C8D62DCB729CE9782@caramon>
	<591E7537BD9C4AF4A670A0B7EB688472@caramon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <591E7537BD9C4AF4A670A0B7EB688472@caramon>
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
To: Fredrik Skog <fredrik.skog@rodang.se>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 22, 2009 at 05:54:59PM +0200, Fredrik Skog wrote:
> I'm a bit confused about how pvmove works now...
> I have done alot och pvmove on the same PV now and the total percentage 
> of all the pvmoves is alot bigger than 100%
> 17%+21%+7%+5%+67%+5%+.....
> Why is that?

Read the pvmove man page.

You should break up the move into lots of smaller pieces using the PE range
syntax.  If the data is contiguous, you'll have moved 67%, the largest
of those numbers, and restarted at the beginning every time.
Better to 'divide and conquer' so you get lots of smaller moves that reach 100%.

Alasdair
