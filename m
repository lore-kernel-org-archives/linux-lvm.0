MIME-Version: 1.0
In-Reply-To: <1366914916.11473.1153.camel@localhost.localdomain>
References: <51791E1A.8020903@libertytrek.org>
	<1366914916.11473.1153.camel@localhost.localdomain>
Date: Thu, 25 Apr 2013 13:49:00 -0500
Message-ID: <CAOAgVpy-jiwGhGcZzXJpXg3e2DYEQ8tYGfB6bdEzbewtpYqihg@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Subject: Re: [linux-lvm] LVM snapshots and filesystem quiescence
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
To: coughlan@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Apr 25, 2013 at 1:35 PM, Tom Coughlan <coughlan@redhat.com> wrote:
>
>> I know that you have to quiesce SQL databases using their own native
>> tools if you want to have a consistent snapshot of the raw db files, but
>> what about other programs like postfix or dovecot that are constantly
>> (on a busy server) writing to disk? Do you need to stop these, take the
>> snapshot, then restart them? Or will the filesystem itself handle this
>> (similar to how VSS works on windows)?
>
> The LVM management tools will automatically suspend the file system
> before taking the snapshot. Refer to the following, from the RHEL 6.4
> Storage Administration Guide:

But having the file system suspended doesn't mean that the files are
in a consistent state from any application's point of view, does it?
Linux fsync() performance has historically been so bad that I would
not expect most applications to use it.

--
  Les Mikesell
    lesmikesell@gmail.com
