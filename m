From: Stonki <stonki@gmx.de>
Message-ID: <5443942989.20011021224832@gmx.de>
Subject: Re[4]: [linux-lvm] pvmove with Bad bocks
In-Reply-To: <20011021224416.B23544@vestdata.no>
References: <55159047260.20011020155124@gmx.de>
 <20011021140746.B15468@vestdata.no> <20011021155622.A9367@btconnect.com>
 <7632207772.20011021193259@gmx.de> <20011021224416.B23544@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sun Oct 21 15:50:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?B?UmFnbmFyIEtq+HJzdGFk?= <linux-lvm@sistina.com>

Hello Ragnar,

Sunday, October 21, 2001, 10:44:16 PM, schriebst Du:

RK> I think there are two potential causes of pvmove erroring out - one is a
RK> bug related to the last allocaten extent, and one is actual disk error.
well its a disk error for sure. Also wrote it in my initial posting
here..

RK> I fail to see why reducing the size will solve any problems if the cause
RK> is a bad disk - I think you need the patch I mentioned earlier, or a
RK> simular fix.
Well, I need this patch for sure :-) But excuse me, but I didn't find
the patch in the mailinglist. The only thing I found was a notice of
Heinz to patch the latest RC for 1.0 in line 520. But I use a much
older version...

can you give me a helping hand ?

with regards,

Stefan Onken
