MIME-Version: 1.0
In-Reply-To: <57287339.7070802@redhat.com>
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl>
	<57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
	<57287339.7070802@redhat.com>
Date: Tue, 3 May 2016 06:41:37 -0400
Message-ID: <CALm7yL3K6pXi4-1cwtW2dVra9SR1FPBzy9sqVLWjLC8Qf=Hi2Q@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=001a113ac342ea88fd0531edc09a
Subject: Re: [linux-lvm] thin handling of available space
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a113ac342ea88fd0531edc09a
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 5:45 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> On 2.5.2016 16:32, Mark Mielke wrote:
>>
>>     If you seek for a filesystem with over-provisioning - look at btrfs,
>> zfs
>>     and other variants...
>>
>> I have to say that I am disappointed with this view, particularly if this
>> is a
>> view held by Red Hat. To me this represents a misunderstanding of the
>> purpose
>>
>
> So first - this is  AMAZING deduction you've just shown.
>
> You've cut sentence out of the middle of a thread and used as kind of
> evidence
> that Red Hat is suggesting usage of ZFS, Btrfs  - sorry man - read this
> thread again...
>

My intent wasn't to cut a sentence in the middle. I responded to the each
sentence in its place. I think it really comes down to this:

This seems to be a crux of this debate between you and the other people. You
>> think the block storage should be as transparent as possible, as if the
>> storage was not thin. Others, including me, think that this theory is
>> impractical, as it leads to edge cases where the file system could choose
>> to
>>
>
> It's purely practical and it's the 'crucial' difference between
>
> i.e. thin+XFS/ext4     and   BTRFS.
>


I think I captured the crux of this pretty well. If anybody suggests that
there could be value to exposing any information related to the nature of
the "thinly provisioned block devices", you suggest that the only route
forwards here is BTRFS and ZFS. You are saying directly and indirectly,
that anybody who disagrees with you should switch to what you feel are the
only solutions that are in this space, and that LVM should never be in this
space.

I think I understand your perspective. However, I don't agree with it. I
don't agree that the best solution is one that fails at the last instant
with ENOSPC and/or for the file system to become read-only. I think there
is a whole lot of grey possibilities between the polar extremes of
"BTRFS/ZFS" vs "thin+XFS/ext4 with last instant failure".

What started me on this list was the CYA mandatory warning about over
provisioning that I think is inappropriate, and causing us tooling
problems. But seeing the debate unfold, and having seen some related
failures in the Docker LVM thin pool case where the system may completely
lock up, I have a conclusion that this type of failure represents a
fundamental difference in opinion around what thin volumes are for, and
what place they have. As I see them as highly valuable for various reasons
including Docker image layers (something Red Hat appears to agree with,
having targeted LVM thinp instead of the union file systems), and the
snapshot use cases I presented prior, I think there must be a way to avoid
the worst scenarios, if the right people consider all the options, and
don't write off options prematurely due to preconceived notions about what
is and what is not appropriate in terms of communication of information
between system layers.

There are many types of information that *are* passed from the block device
layer to the file system layer. I don't see why awareness of thin volumes,
should not be one of them.

For example, and I'm not pretending this is the best idea that should be
implemented, but just to see where the discussion might lead:

The Linux kernel needs to deal with problems such as memory being swapped
out due to memory pressures. In various cases, it is dangerous to swap
memory out. The memory can be protected from being swapped out where
required using various technique such as pinning pages. This takes up extra
RAM, but ensures that the memory can be safely accessed and written as
required. If the file system has particular areas of importance that need
to be writable to prevent file system failure, perhaps the file system
should have a way of communicating this to the volume layer. The naive
approach here might be to preallocate these critical blocks before
proceeding with any updates to these blocks, such that the failure
situations can all be "safe" situations, where ENOSPC can be returned
without a danger of the file system locking up or going read-only.

Or, maybe I am out of my depth, and this is crazy talk... :-)

(Personally, I'm not really needing a "df" to approximate available
storage... I just don't want the system to fail badly in the "out of disk
space" scenario... I can't speak for others, though... I do *not* want
BTRFS/ZFS... I just want a sanely behaving LVM + XFS...)


-- 
Mark Mielke <mark.mielke@gmail.com>

--001a113ac342ea88fd0531edc09a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, May 3, 2016 at 5:45 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2.5.201=
6 16:32, Mark Mielke wrote:</span><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">
=C2=A0 =C2=A0 If you seek for a filesystem with over-provisioning - look at=
 btrfs, zfs<br>
=C2=A0 =C2=A0 and other variants...<br>
<br>
I have to say that I am disappointed with this view, particularly if this i=
s a<br>
view held by Red Hat. To me this represents a misunderstanding of the purpo=
se<br>
</span></blockquote>
<br>
So first - this is=C2=A0 AMAZING deduction you&#39;ve just shown.<br>
<br>
You&#39;ve cut sentence out of the middle of a thread and used as kind of e=
vidence<br>
that Red Hat is suggesting usage of ZFS, Btrfs=C2=A0 - sorry man - read thi=
s thread again...<br></blockquote><div><br></div><div>My intent wasn&#39;t =
to cut a sentence in the middle. I responded to the each sentence in its pl=
ace. I think it really comes down to this:</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This seems to be a crux of this debate between you and the other people. Yo=
u<br>
think the block storage should be as transparent as possible, as if the<br>
storage was not thin. Others, including me, think that this theory is<br>
impractical, as it leads to edge cases where the file system could choose t=
o<br>
</blockquote>
<br></span>
It&#39;s purely practical and it&#39;s the &#39;crucial&#39; difference bet=
ween<br>
<br>
i.e. thin+XFS/ext4=C2=A0 =C2=A0 =C2=A0and=C2=A0 =C2=A0BTRFS.<span class=3D"=
HOEnZb"><font color=3D"#888888"><br>
</font></span></blockquote></div><br><br>I think I captured the crux of thi=
s pretty well. If anybody suggests that there could be value to exposing an=
y information related to the nature of the &quot;thinly provisioned block d=
evices&quot;, you suggest that the only route forwards here is BTRFS and ZF=
S. You are saying directly and indirectly, that anybody who disagrees with =
you should switch to what you feel are the only solutions that are in this =
space, and that LVM should never be in this space.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">I think I understand your pers=
pective. However, I don&#39;t agree with it. I don&#39;t agree that the bes=
t solution is one that fails at the last instant with ENOSPC and/or for the=
 file system to become read-only. I think there is a whole lot of grey poss=
ibilities between the polar extremes of &quot;BTRFS/ZFS&quot; vs &quot;thin=
+XFS/ext4 with last instant failure&quot;.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">What started me on this list was the C=
YA mandatory warning about over provisioning that I think is inappropriate,=
 and causing us tooling problems. But seeing the debate unfold, and having =
seen some related failures in the Docker LVM thin pool case where the syste=
m may completely lock up, I have a conclusion that this type of failure rep=
resents a fundamental difference in opinion around what thin volumes are fo=
r, and what place they have. As I see them as highly valuable for various r=
easons including Docker image layers (something Red Hat appears to agree wi=
th, having targeted LVM thinp instead of the union file systems), and the s=
napshot use cases I presented prior, I think there must be a way to avoid t=
he worst scenarios, if the right people consider all the options, and don&#=
39;t write off options prematurely due to preconceived notions about what i=
s and what is not appropriate in terms of communication of information betw=
een system layers.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">There are many types of information that *are* passed from the=
 block device layer to the file system layer. I don&#39;t see why awareness=
 of thin volumes, should not be one of them.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">For example, and I&#39;m not pretend=
ing this is the best idea that should be implemented, but just to see where=
 the discussion might lead:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">The Linux kernel needs to deal with problems such as =
memory being swapped out due to memory pressures. In various cases, it is d=
angerous to swap memory out. The memory can be protected from being swapped=
 out where required using various technique such as pinning pages. This tak=
es up extra RAM, but ensures that the memory can be safely accessed and wri=
tten as required. If the file system has particular areas of importance tha=
t need to be writable to prevent file system failure, perhaps the file syst=
em should have a way of communicating this to the volume layer. The naive a=
pproach here might be to preallocate these critical blocks before proceedin=
g with any updates to these blocks, such that the failure situations can al=
l be &quot;safe&quot; situations, where ENOSPC can be returned without a da=
nger of the file system locking up or going read-only.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Or, maybe I am out of my d=
epth, and this is crazy talk... :-)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">(Personally, I&#39;m not really needing a &qu=
ot;df&quot; to approximate available storage... I just don&#39;t want the s=
ystem to fail badly in the &quot;out of disk space&quot; scenario... I can&=
#39;t speak for others, though... I do *not* want BTRFS/ZFS... I just want =
a sanely behaving LVM + XFS...)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><div><br></div>-- <br><div class=3D"gmail_signatu=
re">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gmail.com" target=3D"_bla=
nk">mark.mielke@gmail.com</a>&gt;<br><br></div>
</div></div>

--001a113ac342ea88fd0531edc09a--
