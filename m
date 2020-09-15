References: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
	<CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
	<CAJHv+s6TmtZFxRTZW1Yo-2gFee4x5XPa1dpFnP_+EMxtr80DAw@mail.gmail.com>
	<CAAMCDefcYsODUt=fv5u1t=gGKXPtcPMYh8xzH1ztb7R9N0QSHQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5a7c3e08-2bc7-62b3-bfbf-93cc0c706ce8@redhat.com>
Date: Tue, 15 Sep 2020 20:46:09 +0200
MIME-Version: 1.0
In-Reply-To: <CAAMCDefcYsODUt=fv5u1t=gGKXPtcPMYh8xzH1ztb7R9N0QSHQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Issue after upgrading the LVM2 package from
	2.02.176 to 2.02.180
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Roger Heflin <rogerheflin@gmail.com>

Dne 15. 09. 20 v 13:05 Roger Heflin napsal(a):
> #1:
> Device /dev/sda3 excluded by a filter.)
> Failed to execute command: pvcreate -ffy /dev/sda3
> ec=0
> 
> excluded by filter is likely the issue, I think there was a bug were
> it allowed that pvcreate to work when it should have blocked it
> because of the filter.  It should not allow a pvcreate against
> something blocked by a filter.
> 
> #2: Read-only locking type set. Write locks are prohibited.
> I am going to guess either / is not mounted rw, or you don't have the
> directory mounted rw that is needed to create the locks (/var/run/lvm
> usually).
> 
> On Tue, Sep 15, 2020 at 1:42 AM KrishnaMurali Chennuboina
> <krishchennu414@gmail.com> wrote:
>>

Hi

Please consider first to use the recent/upstream version of lvm2
(ATM either 2.02.187  or  2.03.10 or git  master/stable-2.0)

Unfortunately we can't be analyzing all the bugs from all the versions out there.

So please try to provide reproducer with versions listed above.
If you can't reproduced - then you may try to bisect to discover fixing patch.

If you need to fix a particular version on your distro,
you may need to ask your package maintainer to backport
list of patches for you.
In some case however this might be hard - aka it might be more efficient
to simply go with newer version.

Regards

Zdenek
