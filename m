Message-Id: <5.1.1.6.2.20020901044548.01d61470@pop.tvnet.hu>
From: Newsmail <newsmail@satimex.tvnet.hu>
Mime-Version: 1.0
Subject: [linux-lvm] disk failure
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
Date: Sat Aug 31 22:00:29 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello everybody,
maybe its an already answered problem, I dont know,
I just have an lvm array of 3 disks. and the last disk of the array just 
died, as is. I cannot to anything with it, it died, it doesnt even spin up. 
what should I do with my array to make it work, or at least save the data I 
have on it?
I tried vgchange -an -qn to make it active without a quorum, but after I 
didnt have an idea what to do. how can I remove the faultive, non-existing 
drive from it? what should I do?
thanx in advance,
regards,
greg

ps: I'm using reiserfs.
