From: lembark@wrkhors.com
Subject: Re: [linux-lvm] RAID extension and lvm
Message-ID: <15050000.1026663876@duke>
In-Reply-To: <Pine.LNX.4.44.0207141635090.22457-100000@poseidon.ihs.uni-stuttgart.de>
References: <Pine.LNX.4.44.0207141635090.22457-100000@poseidon.ihs.uni-stuttgart
 .de>
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
Date: Sun Jul 14 11:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Sorry, but there is no pvresize command.

You wouldn't want it anyway. 

There isn't any way to "resize" an fault-tolerant RAID
system (1/3/5) and you can get more flexable, reliable
results with LVM than RAID0 anyway.

The way to add space into a VG is by incorporating new
PV's with vgextend. If you want to grow a fault-tolerant
system then build new RAID5 groups and add them as new
PV's.


--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
