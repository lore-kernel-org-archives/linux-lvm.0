From: Lars Kellogg-Stedman <lars@larsshack.org>
Message-ID: <20011127002330.B14754@piglet.house>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Re: Here we go again: vgscan doesn't see my volume groups.
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
Date: Mon Nov 26 23:20:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm-devel@sistina.com
Cc: linux-lvm@sistina.com

Arrrgh, after much fiddling with floppies, as I trundle patched code between my
laptop and my hosed machine, this looks partly like a bug in LVM.

Specifically, in tools/lib/pv_read_all_pv_of_vg.c, in this section of code:

          /* make array contiguous again */
          for ( i = 0; i < np - 2; i++) {
             if ( pv_this[i] == NULL) {
                /* ensure we don't have a sequence of NULLs */
                if ( pv_this[i+1] == NULL) {
                   int j = i + 1;
                   while ( pv_this[j] == NULL && j < np - 1) j++;
                   if ( j < np - 1) pv_this[i+1] = pv_this[j];
                }
                pv_this[i] = pv_this[i+1];
                pv_this[i+1] = NULL;
             }
          }
          np=0;
          while ( pv_this[np] != NULL) np++;

Let's step through this.  Before multiple path/md handling, pv_this[] looked
like this:

  [0] /dev/md0
  [1] /dev/sda
  [2] /dev/sde3
  [3] /dev/sde4

pv_this[1] is set to NULL, because sda is part of md0, so we enter the
above section of code with pv_this[] looking like this:

  [0] /dev/md0
  [1] NULL
  [2] /dev/sde3
  [3] /dev/sde4

In the first iteration of the loop (i=0) nothing changes.

In the second iteration of this loop (i=1), we encounter a NULL value, so
we shift the list down one and set the following element to NULL, leaving us
with:

  [0] /dev/md0
  [1] /dev/sde3
  [2] NULL
  [3] /dev/sde4

And that's it.  Due to the loop condition (i < np - 2), the loop exits,
since np=4 and i would be 2 in the next iteration.  The following code:

          while ( pv_this[np] != NULL) np++;

Will end up setting np to 2, since the NULL value in pv_this[2] will cause
the loop to exit.

I think this loop will work as intended if the loop condition were
i < np -1.  In our situtation, this would cause one more iteration of the loop, and the NULL value in pv_this[2] would cause another shift to occur leaving us with:

  [0] /dev/md0
  [1] /dev/sde3
  [2] /dev/sde4
  [3] NULL

Which looks just great.  I'm ignoring the sub-loop (...ensure we don't have
a sequence of NULLs...) for now, but it probably needs fixing.

I'm about to go check this out.  I noticed that there is@least one other
place in this file that may have a similar problem.  Results in a few minutes.

-- Lars
