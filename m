From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2: Bad LV-UUID?
Message-ID: <20021128131714.A22434@uk.sistina.com>
References: <20021128075428.GX951@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021128075428.GX951@lug-owl.de>; from jbglaw@lug-owl.de on Thu, Nov 28, 2002 at 08:54:28AM +0100
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
Date: Thu Nov 28 07:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 28, 2002 at 08:54:28AM +0100, Jan-Benedict Glaw wrote:
> I've gone to LVM2 yesterday, which included creating LVM2-style PVs, VGs
> and one LV. The strange thing for me is that the LV's UUID is
> "000000-0000-0000-0000-0000-0000-000000", which doesn't really look like
> it was intended... Just a hint for a possible bug somewhere:-)

This behaviour is correct - the values are like this so as to provide 
backwards compatibility with LVM1.  The field is an LVM2 extension of
LVM1's LV number, which is 0 in this particular case.

To see the random UUID values you expected in this field, you'd need
to update your software use the new metadata format.  

Alasdair
-- 
agk@uk.sistina.com
