MIME-Version: 1.0
In-Reply-To: <CA+BsyQ53DooiSj+wErGhM+PemjA7=fKtEBcGHJVmR++tOMo-XQ@mail.gmail.com>
References: <CA+BsyQ4tDvVFXyo2Po9jiFKVobaJhMy7PoxWjczT8KFK9BrXWQ@mail.gmail.com>
	<1ca4pcxqnk.ln2@ID-313208.user.individual.net>
	<CA+BsyQ6ihax71VER=dgCHF-eV0mfjYqZo6LixK21BVrMCGb-Bg@mail.gmail.com>
	<56BF99FF.1030900@redhat.com>
	<CA+BsyQ53DooiSj+wErGhM+PemjA7=fKtEBcGHJVmR++tOMo-XQ@mail.gmail.com>
Date: Sat, 13 Feb 2016 21:31:11 +0000
Message-ID: <CA+BsyQ5Lhvys2eea64T_qE49DaE7gH6QEPsAFi+Nn7VfJ_Ourw@mail.gmail.com>
From: Brendan Heading <brendanheading@gmail.com>
Subject: Re: [linux-lvm] [lvm-devel] MUSL fun
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
To: LVM2 development <lvm-devel@redhat.com>
Cc: buildroot@uclibc.org, LVM general discussion and development <linux-lvm@redhat.com>

>> There is a reason from lvm2 implementation here - freopen() is not giving
>> application full control over internal buffer allocation and we need to be
>> sure we lock-in memory for critical section - and some glibc versions are
>> allocating buffers here via 'mmap' call.
>>
>> That said - there could be accepted a patch checking in configure  for
>> 'read-only' stdin  - and using then #ifdef compilation that would
>> replace use of  internal lvm2 reopen code with libc function.
>
> I had a suspicion you would have a good reason.
>
> On first glance your proposal sounds like a good compromise and one
> that would be worth exploring.

As an alternative idea, what about changing the codebase not to use
stdin/stdout/stderr, using it's own file descriptor names and calling
dup2() as appropriate to set them up on startup ?

Just flying the kite - I haven't looked to see how painful this might be.

Brendan
