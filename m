Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B81C3025
	for <linux-lvm@lists.linux.dev>; Tue,  5 Nov 2024 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809632; cv=none; b=qZPWMo14EQwBIephnpl18WZef7oflgUh2H9aEZApC1kCqrSFAtAa9YEgekPL7xJztDxsrU/ReARusmJS3JMaliU0bnm5A+05/sweUldpFzlkZTYoywV9w3d9w+fAgYt+BUVQU18STN3RYz2xvCY12uPpHvAaXVVXQ6aNt7Qhk2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809632; c=relaxed/simple;
	bh=3tvEA0DLdHNf997NyisfywrKDUnHpmiJ+eZfoFl0v/c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=DUFymSShZiBziQnzVkivRH4aJc4O8BN0npJOia/xi0baHZYGw8weyQ5ovdYVm6yyFLggKncHBc7obrd0sHFfSEZCfFUDKRfsWubmR0JiZKvpbXeLPGjR9I7C1Ql1Ya0S2N4DbdDov4ICVF4Tgvnk/LaKQVujgt4Wt4dETQ60m7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XjSFV6KkRzfdcY
	for <linux-lvm@lists.linux.dev>; Tue,  5 Nov 2024 20:24:30 +0800 (CST)
Received: from kwepemg200014.china.huawei.com (unknown [7.202.181.65])
	by mail.maildlp.com (Postfix) with ESMTPS id 50E661800A2
	for <linux-lvm@lists.linux.dev>; Tue,  5 Nov 2024 20:27:07 +0800 (CST)
Received: from [10.174.178.78] (10.174.178.78) by
 kwepemg200014.china.huawei.com (7.202.181.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 5 Nov 2024 20:27:06 +0800
Message-ID: <5d723c3e-9437-5006-4891-1ba659de30a1@huawei.com>
Date: Tue, 5 Nov 2024 20:27:05 +0800
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: <linux-lvm@lists.linux.dev>
From: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
Subject: hungtask in dm code raised by concurrent run refresh and remove
 command
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200014.china.huawei.com (7.202.181.65)

Hi Team,
Here's a hungtask issue occurs in the dm-snapshot scenario，
reproduce by concurrent run vgchange --refresh and dmsetup -f remove vg-snap.

            vgchange                   dmsetup                dmsetup
     table_load (load snapshot)
                             table_load snapshot to error
                                    remove snapshot
     suspend origin/cow/real
table_load(snapshot already remove)
take type_lock and issue io to cow in snapshot_ctr
                                                      table_load (wait type_lock)

[root@localhost ~]# ps aux | grep D
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     1818066  0.0  0.0      0     0 ?        D    Nov04   0:03 [kworker/3:2+ksnaphd]
root     2972729  0.5  2.1  87256 73032 pts/1    D<L  20:17   0:00 vgchange --refresh vg
root     2972761  0.0  0.3  23464 10636 pts/1    D    20:17   0:00 dmsetup -f remove vg-snap

Snapshot has remove after suspend origin/cow/real during vgchange --refresh, and then load
snapshot will take type_lock and issue io to cow in snapshot_ctr, the io process by kworker
but cow has suspend lead to hungtask in kernel.

Does we have some way to fix it?
Thanks
