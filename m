Message-ID: <20011008204254.19061.qmail@web20201.mail.yahoo.com>
Date: Mon, 8 Oct 2001 13:42:54 -0700 (PDT)
From: Lee Go-Tze <leegotze@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM metsdata
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@sistina.com>

I have a novice question.  How does the LVM 
protect its metadata.  I mean does it do some 
sort of metadata check when machine comes up 
(notices the system did not shutdown properly)?
Or maybe it uses journaling? I imagine the 
updates to lv/vg/pv structures have to be 
transactional.

Thanks,

Go-Tze

__________________________________________________
Do You Yahoo!?
NEW from Yahoo! GeoCities - quick and easy web site hosting, just $8.95/month.
http://geocities.yahoo.com/ps/info1
