Date: Tue, 09 Oct 2001 16:01:16 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
Message-ID: <545440000.1002657676@tiny>
In-Reply-To: <20011009204249.A1201@btconnect.com>
References: <387040000.1002641567@tiny> <20011009165801.B851@btconnect.com>
 <407510000.1002645036@tiny> <20011009203031.B1034@btconnect.com>
 <20011009204249.A1201@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Tuesday, October 09, 2001 08:42:49 PM +0100 Joe Thornber
<thornber@btconnect.com> wrote:

> Now I think about it maybe the change was made in order to allow LV's
> to be used as raw devices.  In which case we are being harsh on you.
> I'll talk to Heinz.
> 

BTW, could you also read through lvm_snapshot_COW(), the while(chunksize)
loop seems a little wrong.  What happens when it takes more than one
interation?  org_start and snap_start are never incremented, so every
interation copies the same physical blcoks.

-chris
