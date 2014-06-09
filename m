Message-ID: <53958348.3000501@redhat.com>
Date: Mon, 09 Jun 2014 11:50:00 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <53924E22.60403@mooluv.com>
In-Reply-To: <53924E22.60403@mooluv.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm Bug? - bad reaction to snapshot creation
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
To: linux-lvm@redhat.com, me@mooluv.com

Dne 7.6.2014 01:26, Leeman Strout napsal(a):
>
> Creating a snapshot throws an error "Attempted to decrement suspended device
> counter below zero." but succeeds.  Removing the snapshot fails, attempting a
> 2nd time succeeds.  Somewhere in this process the original LV gets locked and
> the system needs to be restarted to unlock it.  As explained below this
> happens intermittently but regularly.
>
>
> Any additional info please let me know directly, I am not a subscriber,


Hi


Unsure if this relates to all your problem (since I'm not sure how arch linux
is in sync with udev rules & systemd version)

At certain moment  systemd added a new 'feature' about locking devices while
updating internal udev state - this locking ignores any udev rule flags and 
opens internal lvm2 devices - so while for now it's been again disabled for 
'dm' devices - you might have installed version of system which has the 'lock 
everything' feature in?

Thought this doesn't explain your 'counter below zero' error - this looks like
some incorrect udev rules are running in the field ?
(Or maybe multiple  systemd-udevd are running ?)

Zdenek
