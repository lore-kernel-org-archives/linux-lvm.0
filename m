From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back device
Message-ID: <20021020153212.GA2950@localhost>
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost> <3DAFB713.A2E7FAB3@silicide.dk> <20021018213759.GA4471@localhost> <3DB266FF.94DA814C@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DB266FF.94DA814C@silicide.dk>
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
Date: Sun Oct 20 10:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sunday, 20 October 2002, at 10:19:11 +0200,
Jon Bendtsen wrote:

> > As said in my first post to this thread, the encryption layer is
> > provided by loop-aes (loop-aes.sourceforge.net), which is easy to setup
> > and is quite well documented (except for one little but annoying detail:
> > instead of "AES", the algorithm is called "rijndael", otherwise "loop"
> > complains loudly about an "unknown algorithm type").
> 
> hmm ?? rijndael ?
> I've used it just fine with losetup -e AES256
> 
Just a final note, and trying not to go too off-topic, this is maybe an
issue with my "mount" package version more than a "loop-aes" problem.
But I am not sure of which program or code checks for the "correctness"
of an algorithm name when you use "losetup" (in fact, the /proc/cipher
files don't appear on my system :-).

I will investigate it further, but this is off-topic here, so end of
thread on my part ;-).

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
