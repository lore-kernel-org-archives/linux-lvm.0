Subject: Re: [linux-lvm] LVM2: Problems with "lvextend" on device with mounted filesystem
Message-ID: <13009-56014@sneakemail.com>
References: <3FC757CA.2030205@daemons-point.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FC757CA.2030205@daemons-point.com>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Dec  1 07:57:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Uli Heller wrote 90 lines:

[resorted, cut, mangled ...]
> 1) Create a new logical volume:
> 2) Display this new LV:
> 2.5)     Create and mount a file system on the LV:
> 3) Try to write right behind the end of the LV:
> ~   --> This error message is OK
> 4) Extend the LV:
> 5) Repeat step 3
[which generates an error]

> 3,4,5)   Like above **BUT** step 5 now produces the same
> ~   error message as step 3! You have to "umount /mnt"
> ~   in order to be able to access the enlarged portion
> ~   of the LV.

You never told reiserfs that it's partition had increased.  AFAIK
you can either remount it with the correct parameters or use some
tool to alert it.

-Wolfgang
