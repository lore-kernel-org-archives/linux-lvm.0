Message-ID: <3DB266FF.94DA814C@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back 
 device
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost> <3DAFB713.A2E7FAB3@silicide.dk> <20021018213759.GA4471@localhost>
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
Date: Sun Oct 20 03:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jose Luis Domingo Lopez wrote:
> =

> On Friday, 18 October 2002, at 09:24:03 +0200,
> Jon Bendtsen wrote:
> =

> > Jos=E9 Luis Domingo L=F3pez wrote:
> > > I haven't tried, but wouldn't it be possible to just take a snapsho=
ts
> > > from a LV containing an encrypted filesystem, and then loop-mount i=
t
> > > (assuming encrypted via the loop device), give the password, and th=
en
> > > backup ?
> >
> Well, I finally got to work, and made some test, as promised... And it
> seems to work !. A list of commands used (and explanations) follows:

oops, i knew i forgot something. I made loop-aes work as well. Sorry.
I even talked with Jari, and he said the problem was that ppdd used the
first 1k of the block device, which AES (and other loop-aes ciphers)
didnt.


[cut]


> As said in my first post to this thread, the encryption layer is
> provided by loop-aes (loop-aes.sourceforge.net), which is easy to setup=

> and is quite well documented (except for one little but annoying detail=
:
> instead of "AES", the algorithm is called "rijndael", otherwise "loop"
> complains loudly about an "unknown algorithm type").

hmm ?? rijndael ?
I've used it just fine with losetup -e AES256




JonB
