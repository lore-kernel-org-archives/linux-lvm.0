Date: Fri, 7 Sep 2001 11:43:03 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010907114303.C19457@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com> <20010906220514.A1537@vestdata.no> <E15f8l7-0008Di-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15f8l7-0008Di-00@hermes.sistina.com>; from fejf@gmx.de on Fri, Sep 07, 2001 at 01:41:22AM +0200
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Sep 07, 2001 at 01:41:22AM +0200, FEJF wrote:
> there are no io-errors... but as the hd makes really scary noise when p=
vmove=20
> tries to move the remaining bytes. so i think the hd is damaged.
> but all i want is to remove the damaged hd.
> but pvreduce says i have to use pvmove to get rid of the remaining data=
 and=20
> pvmove gives the errors...
> so i can't remove it :/ - is there a way to get rid of the hd without=20
> destroying the rest of the data ? sth. like pvreduce --force ?

No, don't think so.

I have a patch, but I'm not so sure I can recommend that you use it.

I only wrote it to copy off a single block of a bad disk - I'm not sure
exactly how it will behave when moving multiple blocks (if the
non-corrupted blocks will end up in the right spot, or if it writes too
little data, so it will be some bytes off).



--=20
Ragnar Kj=F8rstad
Big Storage
