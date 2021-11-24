
@testset "ConvexCalls" begin
    #wasteful way of enforcing convexity, good test with very large dimension 
    ul = Float64.([1400, 1500, 1600, 1650, 1700, 1750, 1800, 1850, 1900, 1950, 2000, 2025, 2050, 2075, 2100, 2125, 2150, 2175, 2200, 2210, 2220, 2225, 2230, 2240, 2250, 2260, 2270, 2275, 2280, 2290, 2300, 2310, 2320, 2325, 2330, 2340, 2350, 2360, 2370, 2375, 2380, 2385, 2390, 2395, 2400, 2405, 2410, 2415, 2420, 2425, 2430, 2435, 2440, 2445, 2450, 2455, 2460, 2465, 2470, 2475, 2480, 2485, 2490, 2495, 2500, 2505, 2510, 2515, 2520, 2525, 2530, 2535, 2540, 2545, 2550, 2555, 2560, 2565, 2570, 2575, 2580, 2585, 2590, 2595, 2600, 2605, 2610, 2615, 2620, 2625, 2630, 2635, 2640, 2645, 2650, 2655, 2660, 2665, 2670, 2675, 2680, 2685, 2690, 2695, 2700, 2705, 2710, 2715, 2720, 2725, 2730, 2735, 2740, 2745, 2750, 2755, 2760, 2765, 2770, 2775, 2780, 2785, 2790, 2795, 2800, 2805, 2810, 2815, 2820, 2825, 2830, 2835, 2840, 2845, 2850, 2855, 2860, 2865, 2870, 2875, 2880, 2885, 2890, 2895, 2900, 2905, 2910, 2915, 2920, 2925, 2930, 2935, 2940, 2945, 2950, 2955, 2960, 2965, 2970, 2975, 2980, 2985, 2990, 2995, 3000, 3005, 3010, 3015, 3020, 3025, 3050, 3075, 3100, 3150])
    yl = [1439.0248640111151, 1339.0248640111147, 1239.0498846154915, 1189.0498846154915, 1139.0498846154915, 1089.0498846154917, 1039.074905219868, 989.0999258242443, 939.0999258242443, 889.1249464286211, 839.1499670329974, 814.1499670329979, 789.1749876373742, 764.1749876373742, 739.2000082417508, 714.2250288461278, 689.2500494505039, 664.2750700548804, 639.300090659257, 629.300090659257, 619.325111263634, 614.3501318680105, 609.3501318680105, 599.3501318680101, 589.3751524723866, 579.4001730767632, 569.4001730767632, 564.4001730767636, 559.4251936811402, 549.4502142855163, 539.4502142855163, 529.5002554942694, 519.5002554942694, 514.5002554942698, 509.5252760986464, 499.55029670302247, 489.600337911776, 479.600337911776, 469.6503791205291, 464.6503791205291, 459.65037912052867, 454.6753997249052, 449.7004203292822, 444.70042032928177, 439.7254409336583, 434.75046153803487, 429.75046153803487, 424.7754821424114, 419.7754821424119, 414.8255233511645, 409.85054395554107, 404.85054395554107, 399.8755645599176, 394.90058516429417, 389.9506263730477, 384.9506263730477, 380.0006675818008, 375.00066758180037, 370.0507087905535, 365.07572939493, 360.1007499993066, 355.1257706036836, 350.1507912080597, 345.2008324168128, 340.2258530211898, 335.2758942299424, 330.3009148343194, 325.3509560430721, 320.3759766474486, 315.4260178562022, 310.4760590649548, 305.50107966933183, 300.5511208780845, 295.6011620868376, 290.65120329559113, 285.7262651087208, 280.7763063174739, 275.82634752622744, 270.8763887349801, 265.9264299437332, 261.0265123612394, 256.0765535699925, 251.15161538312213, 246.22667719625179, 241.326759613758, 236.40182142688764, 231.4768832400173, 226.5769656575235, 221.6770480750297, 216.80215109691244, 211.90223351441864, 207.0023159319253, 202.10239834943104, 197.25252197569034, 192.40264560194964, 187.55276922820894, 182.7028928544687, 177.853016480728, 173.0531813157404, 168.2033049419997, 163.4034697770121, 158.6036346120245, 153.85384065579, 149.0540054908024, 144.35425274332147, 139.60445878708651, 134.85466483085247, 130.15491208337107, 125.50520054464278, 120.85548900591493, 116.20577746718664, 111.60610713721144, 107.05647801598934, 102.55689010352035, 98.0573021910518, 93.55771427858281, 89.15820878361956, 84.75870328865676, 80.45928021120062, 76.15985713374448, 71.96051647379363, 67.81121702259657, 63.7619999889057, 59.81286537272126, 55.86373075653637, 52.11476097536456, 48.4158324029454, 44.816986248032435, 41.368263719379, 38.06966481698464, 34.87114833209648, 31.77271426471475, 28.87377745054482, 26.12151096912362, 23.519368113961946, 21.117390093812674, 18.915576908675803, 16.813846141045246, 14.912280208426978, 13.210879110821338, 11.609560430721558, 10.20840658563452, 8.907335158053684, 7.756387356731921, 6.755563181669913, 5.954903841620023, 5.154244501570531, 4.553749996533156, 3.953255491495838, 3.452843403964664, 3.0775343383164113, 2.702225272667988, 2.4019780201493006, 2.1517719763837704, 1.9015659326182117, 1.7264217019822752, 1.551277471346424, 1.4011538450871228, 1.2760508232042724, 1.175968405698157, 1.075885988191871, 1.000824175062192, 0.9257623619325699, 0.8507005488028767, 0.7756387356731977, 0.7255975269200974, 0.6755563181669899, 0.6255151094138682, 0.5754739006608176, 0.5754739006607821, 0.42535027440145257, 0.30024725251868034, 0.20016483501244764, 0.10008241750621849]
    m = length(ul)
    dmat = zeros(Float64, (2 * m, 2 * m))
    for i = 1:m
        dmat[i, i] = 1.0
        dmat[m+i, m+i] = 1e-7
    end
    dvec = zeros(Float64, 2 * m)
    dvec[1:m] = yl

    gCsr = spzeros(Float64, Int, (2 + m * m - m, 2 * m))
    for i = 1:m
        for j = 1:m
            gCsr[(i-1)*(m-1)+j, i] = -1.0
            gCsr[(i-1)*(m-1)+j, j] = 1.0
            gCsr[(i-1)*(m-1)+j, m+i] = -(ul[j] - ul[i])
        end
        for j = (i+1):m
            gCsr[(i-1)*(m-1)+j-1, i] = -1.0
            gCsr[(i-1)*(m-1)+j-1, j] = 1.0
            gCsr[(i-1)*(m-1)+j-1, m+i] = -(ul[j] - ul[i])
        end
    end
    gCsr[m*m-m+1, m+1] = 1.0
    gCsr[m*m-m+2, m+m] = -1.0
    bvec = zeros(Float64, 2 + m * m - m)
    bvec[m*m-m+1] = -1 + 1e-5
    bvec[m*m-m+2] = 1e-5
    amat, aind = convertSparse(copy(gCsr'))
    println(size(aind))
    for i = 1:m
        dmat[m+i, m+i] = 1.0 / sqrt(dmat[m+i, m+i])
    end
    total = @elapsed sol, lagr, crval, iact, nact, iter = solveQPcompact(copy(dmat), copy(dvec), amat, aind, copy(bvec), factorized = true)
    println(sol, " ", crval, " ", iter, " in ", total)
    println(size(sol), " ", size(yl))
    rmse = rmsd(sol[1:m], yl)
    println("RMSE ", rmse, " ", rmse^2)
    @test isapprox(4.5e-5, rmse^2, atol = 1e-6)
    #Problem : gCsr * sol - bvec < 0 for some indices!
    # z = Variable(2*m)
    # problem = minimize(square(norm(dmat * (z - dvec))), -gCsr * z <= -bvec)
    # ##solve!(problem, () -> SCS.Optimizer(verbose = 0))
    # Convex.solve!(problem, () -> COSMO.Optimizer(verbose = false, eps_rel = 1e-8, eps_abs = 1e-8))
    # println("problem status is ", problem.status, " optimal value is ", problem.optval)
    # pricesf = Convex.evaluate(z)
end