Date: Wed, 8 Nov 2000 17:53:26 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108175326.D3650@inspiron.suse.de>
References: <20001107142152.G1276@inspiron.random> <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org> <20001107174504.A5834@inspiron.suse.de> <20001107170420.D12477@redhat.com> <20001107205137.A7093@inspiron.suse.de> <20001108111028.F11411@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001108111028.F11411@redhat.com>; from sct@redhat.com on Wed, Nov 08, 2000 at 11:10:28AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

On Wed, Nov 08, 2000 at 11:10:28AM +0000, Stephen C. Tweedie wrote:
> "sorry, this operation is not possible" and saying "sure, fine"
> followed by a thousand IO errors in the syslog when the user tries to
> mount the ext3 filesystem.  Journal recovery can generate several

I agree the bug is annoying but OTOH it's also _harmless_ as far I can see and
I _much_ prefer to fix by making the snapshot writeable (side note: writeable
and persistent are completly orthogonal features). Note that you will get I/O
errors if during the writes you run out of snapshot space (this is possible if
you given less space to the snapshot than to the real blockdevice) so expect
I/O errors in that case too. Really we could allow the creation of a writeable
snapshot only if the user made the snapshot as large as the real logical
volume, but I think that shouldn't be a requirement and a warning during the
snapshot creation should be enough IMHO. (if the user want to make
sure not to run out of snapshot space he should only care to give
to the snapshot the same space he given to the snapshotted blockdevice)

Another possible feature then is to be able to snapshot a snapshot
(however to make that to work we should break some more assumption of the
userspace tools).

Andrea
