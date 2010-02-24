Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1ON28WD017714
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 18:02:08 -0500
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1ON1qUh021878
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 18:01:52 -0500
Received: from [172.20.10.153] (unknown [12.109.229.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id EA3576C388
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 15:46:09 -0700 (MST)
Message-ID: <4B85AC31.8010508@brunson.com>
Date: Wed, 24 Feb 2010 15:46:09 -0700
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
References: <4ABA8D56.8060803@brunson.com>
	<20090923214034.GE3866@agk-dp.fab.redhat.com>
In-Reply-To: <20090923214034.GE3866@agk-dp.fab.redhat.com>
Content-Type: multipart/alternative;
	boundary="------------000006060702080606060703"
Subject: Re: [linux-lvm] Snapshot rollback
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------000006060702080606060703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2009 03:40 PM, Alasdair G Kergon wrote:
> On Wed, Sep 23, 2009 at 03:04:22PM -0600, Eric Brunson wrote:
>    
>> I remember seeing somewhere discussion of adding the ability to roll
>> back to a snapshot.  I think of how cool this would be about ever six
>> months, usually coinciding with an impending Fedora release.  ;-)
>>      
> The developers are just starting to submit their patch sequence to the
> development mailing lists (dm-devel and lvm-devel) for review.  So
> that's targetting linux-next in the next few weeks ready for the 2.6.33
> kernel.
>
>    

 From the newly released 2.6.33 kernel changelog, does this mean what I 
think it means?

    commit 53365383c4667aba55385cd1858582c19a7a8a36
    Merge: 51b736b d2fdb77
    Author: Linus Torvalds<torvalds@linux-foundation.org>
    Date:   Tue Dec 15 09:12:01 2009 -0800

         Merge git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm

         * git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm: (80 commits)
           dm snapshot: use merge origin if snapshot invalid
           dm snapshot: report merge failure in status
           dm snapshot: merge consecutive chunks together
           dm snapshot: trigger exceptions in remaining snapshots during merge
           dm snapshot: delay merging a chunk until writes to it complete
           dm snapshot: queue writes to chunks being merged
           dm snapshot: add merging
           dm snapshot: permit only one merge at once
           dm snapshot: support barriers in snapshot merge target
           dm snapshot: avoid allocating exceptions in merge
           dm snapshot: rework writing to origin
           dm snapshot: add merge target
           dm exception store: add merge specific methods
           dm snapshot: create function for chunk_is_tracked wait
           dm snapshot: make bio optional in __origin_write
           ...
       


If it does, then I'm very excited.  :-)

e.


--------------000006060702080606060703
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="Content-Type">
</head>
<body text="#000000" bgcolor="#ffffff">
On 09/23/2009 03:40 PM, Alasdair G Kergon wrote:
<blockquote cite="mid:20090923214034.GE3866@agk-dp.fab.redhat.com"
 type="cite">
  <pre wrap="">On Wed, Sep 23, 2009 at 03:04:22PM -0600, Eric Brunson wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">I remember seeing somewhere discussion of adding the ability to roll  
back to a snapshot.  I think of how cool this would be about ever six  
months, usually coinciding with an impending Fedora release.  ;-)
    </pre>
  </blockquote>
  <pre wrap="">
The developers are just starting to submit their patch sequence to the
development mailing lists (dm-devel and lvm-devel) for review.  So
that's targetting linux-next in the next few weeks ready for the 2.6.33
kernel.

  </pre>
</blockquote>
<br>
From the newly released 2.6.33 kernel changelog, does this mean what I
think it means?<br>
<br>
<blockquote>
  <pre>commit 53365383c4667aba55385cd1858582c19a7a8a36
Merge: 51b736b d2fdb77
Author: Linus Torvalds <a class="moz-txt-link-rfc2396E" href="mailto:torvalds@linux-foundation.org">&lt;torvalds@linux-foundation.org&gt;</a>
Date:   Tue Dec 15 09:12:01 2009 -0800

    Merge git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm
    
    * git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm: (80 commits)
      dm snapshot: use merge origin if snapshot invalid
      dm snapshot: report merge failure in status
      dm snapshot: merge consecutive chunks together
      dm snapshot: trigger exceptions in remaining snapshots during merge
      dm snapshot: delay merging a chunk until writes to it complete
      dm snapshot: queue writes to chunks being merged
      dm snapshot: add merging
      dm snapshot: permit only one merge at once
      dm snapshot: support barriers in snapshot merge target
      dm snapshot: avoid allocating exceptions in merge
      dm snapshot: rework writing to origin
      dm snapshot: add merge target
      dm exception store: add merge specific methods
      dm snapshot: create function for chunk_is_tracked wait
      dm snapshot: make bio optional in __origin_write
      ...
  </pre>
</blockquote>
<br>
If it does, then I'm very excited.&nbsp; :-)<br>
<blockquote></blockquote>
e.<br>
<br>
</body>
</html>

--------------000006060702080606060703--
