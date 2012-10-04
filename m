Message-ID: <506DA0B4.5020208@redhat.com>
Date: Thu, 04 Oct 2012 15:44:04 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
	<506D055E.901@mohawksoft.com> <506D1931.4040102@tlinx.org>
	<506D624A.5070104@mohawksoft.com>
In-Reply-To: <506D624A.5070104@mohawksoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access or interface to list of blocks that have,
 changed	via C.O.W.?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mark Woodward <markw@mohawksoft.com>, Linda Walsh <lvm@tlinx.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/04/2012 11:17 AM, Mark Woodward wrote:
> I was going to try to answer in line, but decided that it would be
> too much work. There are utilities to extract the exception table
> out of the LVM2 snapshot, and if you can code in almost any
> language, you can write your own. It is dead simple. You can google
> for ddsnap and zumastore to

ddsnap was the Zumastor snapshot tool which uses a different in-kernel
snapshot target and metadata format. It does not share code with
current (or historic afaik) LVM2/device-mapper and has been dead for a
number of years (last commits around 2008).

> get the code. It old and not supported currently, but still works.
> I

Really? I'd be surprised if it even builds against modern kernels or
device-mapper.

> The format of the array is simple: old_address (The offset in the 
> volume) followed by the new_address (the offset in the COW device).
> An array of all the "old_address" values is the changed block list.
> You don't even need to worry about the data if you can really get a
> file list by blocks.

If you really want to poke into the CoW store format I'd start by
reading dm-snap-persistent.c which is the traditional device-mapper
snapshot format.

Snapshots using the thinp target use the metadata format described in
dm-thin-metadata.c.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlBtoLQACgkQ6YSQoMYUY95MgACdFnOXbJC03HjQA8/p8kKxXeLD
ALMAmQFhD+OfKiA2YV9RS3kaUGFzvzE0
=wsdZ
-----END PGP SIGNATURE-----
