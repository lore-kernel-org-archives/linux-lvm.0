From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Testing LVM2
Message-ID: <20030715172406.R19265@uk.sistina.com>
References: <20030714002149.GA1041@trip.muon.local> <20030715012858.Q19265@uk.sistina.com> <20030715174134.GA657@trip.muon.local>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030715174134.GA657@trip.muon.local>; from nils@muon.de on Tue, Jul 15, 2003 at 05:41:34PM +0000
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
Date: Tue Jul 15 11:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nils Juergens <nils@muon.de>
Cc: linux-lvm@sistina.com

On Tue, Jul 15, 2003 at 05:41:34PM +0000, Nils Juergens wrote:
> In fact, it does. But using lvm2 does not.
 
> I created a vg with on pv and one lv named "test". Then i create ext3
> filesystem on it and mount it. Then i try to create a snapshot of this lv:

Snapshots are not ported to 2.5 yet.

We'll see if we can make this more obvious from the error messages!

Alasdair
-- 
agk@uk.sistina.com
