Message-ID: <4D419C47.202@redhat.com>
Date: Thu, 27 Jan 2011 17:24:39 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
In-Reply-To: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm, config and commandline
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
Cc: xake@rymdraket.net

On 01/27/2011 10:37 AM, xake@rymdraket.net wrote:
> I have a system with a script at bootup currently running something like
> "lvm pvscan && lvm vgscan && lvm vgchange -ay" all with the option
> "--config 'global { locking_dir = "/dev/.lvm" }'" since when the script
> runs /var/lock is not in a writeable state. --ignorelockingfailures is
> fine, but gives a message on stderr I do not want, but I still want to get
> other error messages so "2>/dev/null" is not an option.

Use --sysinit instead of --ignorelockingfailure, no need to set that
locking dir at all in this phase.

If you have some strange messages paste them here, --sysinit is exactly
here to handle read-only device boot problem.
(seems it is just poorly documented...)

Moreover, pvscan and vgscan are NOOP here, because it updates
lvm cache, not possible on read-only system.

All you want is probably:
/sbin/lvm vgchange -a y --sysinit


> I realized however that if I run this as a script using lvm as interpreter
> (running lvm once and the commands inside of lvm) I cut the time for this
> script in half.
> 
> But with that I have the following problem:
> 
> # echo "pvscan --config 'global { locking_dir = "/dev/.lvm" }'" | lvm

Do not do this. if there is lock dir set inlvm.conf to another directory,
it is just recipe for data corruption.

Do not use --config at all, there are only very special cases when it is needed
system init is not one of them.

> Also, would it not also make sens to have --config an option working
> directly on lvm (something like "lvm --config "something" <command>)?

it works this way for one command: lvm <command> --config "something"
but not for the script mode.

Milan
