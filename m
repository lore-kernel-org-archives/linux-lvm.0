From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] cannot extend lv
Message-ID: <13040000.1043010460@[192.168.200.4]>
In-Reply-To: <20030119180753.GA15083@mitethe.eudyptes>
References: <3E2A7AE4.8080801@informatik.uni-erlangen.de>
 <20030119180753.GA15083@mitethe.eudyptes>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sun Jan 19 15:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I understand, I went through the same exercise two months ago.  I
> borrowed a disk from a friend, moved all of the data to it, and rebuilt
> my whole VG setup.  It was a major pain in the neck.

But it's the only way. This is not unique to Sistina's
implementation. Once the filesystem has been striped at
a low level (vs. lvextending it to alternate disks at
the extent level) there isn't any good way to move the
sripes around.

I'd suggest picking up a backup device, though, instead
of a diskdrive. The last thing you need is for a borrowed
drive to croak while you're re-arranging the PV's.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 773 252 1080
