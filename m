Date: Mon, 15 Oct 2018 09:22:46 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181015142246.GA29274@redhat.com>
References: <CAMRbyytqv3w1SZkDKpVA8j-=iz35WGHNdRjgyY3pCpRET+1Qiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRbyytqv3w1SZkDKpVA8j-=iz35WGHNdRjgyY3pCpRET+1Qiw@mail.gmail.com>
Subject: Re: [linux-lvm] WARNING: Combining activation change with other
 commands is not advised - why?
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
Content-Transfer-Encoding: 7bit
To: Nir Soffer <nsoffer@redhat.com>
Cc: "Nisan, Tal" <tnisan@redhat.com>, Denis Chaplygin <dchaplyg@redhat.com>, linux-lvm@redhat.com

On Sun, Oct 14, 2018 at 04:58:29PM +0300, Nir Soffer wrote:
> We (oVirt) combine lvm activation with adding and deleting tags.
> 
> Here is example command we use:
> 
> /usr/sbin/lvm lvchange --config ' devices { preferred_names =
> ["^/dev/mapper/"] ignore_suspended_devices=1 write_cache_state=0
> disable_after_error_count=3 filter = [
> '\''a|/dev/mapper/3600a098038304437415d4b6a59676c56|/dev/mapper/3600a098038304437415d4b6a59676c57|/dev/mapper/3600a098038304437415d4b6a59676c65|/dev/mapper/3600a098038304437415d4b6a59676c66|/dev/mapper/3600a098038304437415d4b6a59676c6d|/dev/mapper/3600a09803830443715d4b6a59676c76|/dev/mapper/3600a098038304437415d4b6a59676c78|/dev/mapper/3600a098038304437415d4b6a59676d43|/dev/mapper/3600a098038304437415d4b6a59676d46|/dev/mapper/3600a098038304437415d4b6a59676d47|/dev/mapper/3600a098038304437415d4b6a59676d4a|/dev/mapper/3600a098038304437415d4b6a59676d4f|/dev/mapper/3600a098038304437415d4b6a59676d50|/dev/mapper/3600a098038304437415d4b6a59676d51|/dev/mapper/3600a098038304437415d4b6a59676d52|'\'',
> '\''r|.*|'\'' ] }  global {  locking_type=1  prioritise_write_locks=1
> wait_for_locks=1  use_lvmetad=0 }  backup {  retain_min = 50  retain_days =
> 0 } ' --autobackup n -a y --deltag IU_4181c731-8b1a-4929-9c30-f3bfa011c129
> --addtag IU__remove_me_ZERO_4181c731-8b1a-4929-9c30-f3bfa011c129
> c80a5bd0-809e-4c4e-97a8-111611105b3e/885511bd-7164-458f-a1ac-1f8ad4355972
> 
> And we get these warnings - this seems to be new  behavior in RHEL 7.5:
> 
>   WARNING: This metadata update is NOT backed up.
>   WARNING: Combining activation change with other commands is not advised.
> 
> Why combining activation with other commands is not advised?

Because they are very different operations.  lvchange is doing two
entirely different commands back to back.  There are various downsides and
lots of ambiguity to doing that.  "Compound commands" were never
introduced in a very planned way, but ad hoc here and there.  They are not
done consistently, the results and errors can be hard to determine,
options used by both commands may be interpreted differently in each (or
you might want to use an option in one command where it means one thing,
but not in the other command where it means something else.)  Or, what if
the first fails, should we go ahead and do the second?  Or which should
happen first anyway?  Or what if the second part depends on the first
part?  All of those things would generally be unpredictable with undefined
behavior.

This appeared in Feb 2017, after we went through the long process of
identifying and programmatically defining each unique lvm command
definition (run 'lvm help all' to see the full list).  Before this nobody
knew what all the lvm commands were, and we sometimes discovered commands
existed that had never really been intended.  Unfortunately, because of
our fairly strict handling of backward compat, we had to leave a lot of
unwanted commands in place in case someone happened to be using it.
