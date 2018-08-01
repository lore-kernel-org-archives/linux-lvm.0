MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23393.3545.410050.534764@quad.stoffel.home>
Date: Tue, 31 Jul 2018 21:33:13 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <CAJCQCtSmBF68LbvCF=qNT5hePaYFOcF7=jB8=MERXBvA-FUMhQ@mail.gmail.com>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
	<CAJCQCtSmBF68LbvCF=qNT5hePaYFOcF7=jB8=MERXBvA-FUMhQ@mail.gmail.com>
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

>>>>> "Chris" == Chris Murphy <lists@colorremedies.com> writes:

Chris> On Fri, Jul 27, 2018 at 1:31 PM, John Stoffel <john@stoffel.org> wrote:
>> 
>> Why don't you run quotas on your filesystems?  Also, none of the
>> filesystems in Linux land that I'm aware of supports shrinking the
>> filesystem while live, it's all a unmount, shrink FS, shrink volume
>> (carefully!) and then re-mount the filesystem.

Chris> Btrfs supports grow and shrink resizes only when mounted. It's
Chris> not possible to resize when unmounted.

That's... bizarre.  Good to know, but bizarre.  That does make it more
appealing to use in day to day situations for sure.  Any thoughts on
how stable this is in real life?

John
