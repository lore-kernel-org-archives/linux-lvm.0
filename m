Message-Id: <3.0.6.32.20000927105531.00eb8d30@laplaza.org>
Date: Wed, 27 Sep 2000 10:55:31 -0600
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] lv not persistent across reboot?
In-Reply-To: <20000927144714.A21932@srv.t-online.de>
References: <avo3tsssjd645dc7l0m7cdav900gm3i9ge@4ax.com>
 <Pine.LNX.4.21.0009251623060.25906-100000@tp.sf.opensales.com>
 <20000926113521.C17132@srv.t-online.de>
 <avo3tsssjd645dc7l0m7cdav900gm3i9ge@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

At 02:47 PM 09/27/2000 +0000, Heinz J. Mauelshagen wrote:
>
>Morning Steve :-{)
>
>On Wed, Sep 27, 2000 at 07:19:14AM -0500, Steve Brueggeman wrote:
>> Does this imply that Linux LVM will also have problems with discs in H.A.
>> configurations? 
>
>Yes.
>
>> 
>> For example: Fibre Channel drives have two ports on them.  If I have a
Linux box
>> with two Host Adapters, and each adapter is connected to the same set of
drives,
>> but on different ports, will v0.8final (without the patch below) have
unstable
>> vgscans?
>
>Yes, it should.
>
>> 
>> I have not been following the high availability mailing list, and a
solution may
>> already exist  there.  If so, and you know how, I'd be interested in a
quick
>> description.
>
>Not that i am aware of.

Does anybody have any experience to contribute about what other
LVM systems do in these situations?  They don't have the dynamic
scan/assignment stuff in Solaris or AIX, right?  (Showing my
ignorance here).

My experience of FC-AL setups is limited to theoretical at this
point, but I had been wondering how they are addressed by systems.
Is the dual-port stuff handled within the driver such that it's
not actually presented as two separate "devices"?  The presence
of two ports is a redundancy (+optionally performance) issue,
so that would almost make sense to me that one would hide the
physical reality inside the driver.

-- mats
