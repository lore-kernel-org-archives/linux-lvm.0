From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] extending a logical volume
In-Reply-To: <E16Syml-0004V1-00@arwen.dev33.cvf>
Message-Id: <Pine.LNX.4.10.10201221211580.24040-100000@pzat.meep.org>
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
Date: Tue Jan 22 06:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I really which the filesystem people would add support for lvm,
partitulary when "shrinking". At the moment you have to strink then FS,
then strink the LVM, it scares the hell out of me that I will get the
sizes wrong and badness would happen, ie part of the resized fs becomes
unaddressable. (all it needs is someone to take a different definition of
MB for example).

James
