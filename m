Subject: Re: [linux-lvm] LVM+Webmin
References: <F214USgwj3ErkXWWAD40000d8e0@hotmail.com>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: "Rado S"'s message of "Sat, 01 Dec 2001 10:59:42 -0700"
Message-ID: <wxxadx2dd9p.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Sat Dec  1 12:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"Rado S" <radigyy@hotmail.com> writes:

> Is there someone working on a LVM module for Webmin? 

  I've written a set of perl backendmodules that could be used for
  Webmin if someone wanted to set it up. so far these modules support
  the basics of dumping information, resizing (well, extending)
  logical volumes and such things. I just haven't bothered with it
  lately as the standard tools to work with LVM are nice enough in
  most cases. also, if you work with installing new hardware and such
  things I like to think that using fdisk, pvcreate and such things
  are practical, just for the safety of your system.

> Any URL are welcome!

  I haven't made the modules publicly accessible yet, but that can be
  done rather quickly. 

-- 
Terje
